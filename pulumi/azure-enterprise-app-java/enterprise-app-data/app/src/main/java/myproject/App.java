package myproject;

import com.pulumi.Pulumi;

import java.io.IOException;
import java.nio.file.Paths;
import java.nio.file.FileSystemException;

import java.nio.file.Files;

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
                                                        .tier("Basic") // Options: Basic, Standard, Premium,
                                                                       // GeneralPurpose
                                                        .build())
                                        .requestedBackupStorageRedundancy("Local") // Options: Local, Zone, Geo
                                        .build());

                        // Export outputs
                        try {
                                var readme = Files.readString(Paths.get("./Pulumi.README.md"));
                                ctx.export("readme", Output.of(readme));
                                ctx.export("sqlServerName", sqlServer.name());
                                ctx.export("sqlServerFqdn", sqlServer.fullyQualifiedDomainName());
                                ctx.export("sqlDatabaseName", sqlDatabase.name());
                                // Connection string (without password for security)
                                ctx.export("baseSQLConnectionString", Output
                                                .all(sqlServer.fullyQualifiedDomainName(), sqlDatabase.name())
                                                .applyValue(values -> String.format(
                                                                "Server=tcp:%s,1433;Database=%s;",
                                                                values.get(0), values.get(1))));
                        } catch (IOException e) {
                                throw new RuntimeException(e);
                        }
                });
        } // end of main
} // end of class