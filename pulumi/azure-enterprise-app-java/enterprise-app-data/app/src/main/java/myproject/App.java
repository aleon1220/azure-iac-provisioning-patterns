package myproject;

import com.pulumi.Pulumi;
import com.pulumi.Config;
import com.pulumi.core.Output;

import com.pulumi.azurenative.sql.Server;
import com.pulumi.azurenative.sql.ServerArgs;
import com.pulumi.azurenative.sql.Database;
import com.pulumi.azurenative.sql.DatabaseArgs;
import com.pulumi.azurenative.sql.inputs.SkuArgs;

public class App {
        public static void main(String[] args) {
                Pulumi.run(ctx -> {
                        Config config = null;
                        var resourceGroup = "anz-devops-sre-platform-engineering-research-dev";
                        var locationName = "WestUS2";
                        // SQL Server configuration - use secrets for credentials
                        var sqlAdminUsername = ctx.config().require("sqlAdminUsername");
                        var sqlAdminPassword = ctx.config().requireSecret("sqlAdminPassword");

                        // SQL Server 2022 Database
                        // Create Azure SQL Server (version 12.0 supports SQL Server 2022)
                        var sqlServer = new Server("sqlserver", ServerArgs.builder()
                                        .resourceGroupName(resourceGroup)
                                        .location(locationName)
                                        .administratorLogin(sqlAdminUsername)
                                        .administratorLoginPassword(sqlAdminPassword)
                                        .version("12.0") // Azure SQL logical server version
                                        .minimalTlsVersion("1.2")
                                        .publicNetworkAccess("Enabled") // Set to "Disabled" for private-only access
                                        .build());

                        // Create SQL Database with SQL Server 2022 compatibility level (160)
                        var sqlDatabase = new Database("sqldb", DatabaseArgs.builder()
                                        .resourceGroupName(resourceGroup)
                                        .serverName(sqlServer.name())
                                        .location(locationName)
                                        .sku(SkuArgs.builder()
                                                        .name("Basic") // Options: Basic, S0, S1, P1, etc.
                                                        .tier("Basic") // Options: Basic, Standard, Premium, GeneralPurpose
                                                        .build())
                                        .requestedBackupStorageRedundancy("Local") // Options: Local, Zone, Geo
                                        .build());

                        // Export outputs
                        ctx.export("sqlServerName", sqlServer.name());
                        ctx.export("sqlServerFqdn", sqlServer.fullyQualifiedDomainName());
                        ctx.export("sqlDatabaseName", sqlDatabase.name());

                        // Connection string (without password for security)
                        ctx.export("generic SQLConnectionString", Output
                                        .all(sqlServer.fullyQualifiedDomainName(), sqlDatabase.name())
                                        .applyValue(values -> String.format(
                                                        "Server=tcp:%s,1433;Database=%s;Encrypt=True;TrustServerCertificate=False;",
                                                        values.get(0), values.get(1))));

                        ctx.export("readme", Output.of("README.md"));
                });
        } // end of main
} // end of class