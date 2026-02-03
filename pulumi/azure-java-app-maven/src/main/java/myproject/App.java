package myproject;

import com.pulumi.Pulumi;

import com.pulumi.azurenative.resources.ResourceGroup;
import com.pulumi.azurenative.storage.StorageAccount;
import com.pulumi.azurenative.storage.StorageAccountArgs;
import com.pulumi.azurenative.storage.enums.Kind;
import com.pulumi.azurenative.storage.enums.SkuName;
import com.pulumi.azurenative.storage.inputs.SkuArgs;

public class App {
    public static void main(String[] args) {
        Pulumi.run(ctx -> {
            var resourceGroup = new ResourceGroup("resourceGroup-pulumi-demo");

            var storageAccount = new StorageAccount("sa", StorageAccountArgs.builder()
                    .resourceGroupName(resourceGroup.name())
                    .sku(SkuArgs.builder().name(SkuName.Standard_LRS).build())
                    .kind(Kind.StorageV2).build());

            // Export outputs
            ctx.export("resourceGroupName", resourceGroup.name());
            ctx.export("storageAccountName", storageAccount.name());
        });
    } // end of main
} // end of class