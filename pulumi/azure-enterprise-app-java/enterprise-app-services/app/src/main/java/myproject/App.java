package myproject;

import java.util.List;

import com.pulumi.Pulumi;
import com.pulumi.Context;
import com.pulumi.core.Output;
import com.pulumi.resources.StackReference;

import com.pulumi.azurenative.resources.ResourceGroup;
import com.pulumi.azurenative.resources.ResourceGroupArgs;

import com.pulumi.azurenative.compute.VirtualMachine;
import com.pulumi.azurenative.compute.VirtualMachineArgs;
import com.pulumi.azurenative.compute.inputs.HardwareProfileArgs;
import com.pulumi.azurenative.compute.inputs.NetworkProfileArgs;
import com.pulumi.azurenative.compute.inputs.OSProfileArgs;
import com.pulumi.azurenative.compute.inputs.LinuxConfigurationArgs;
import com.pulumi.azurenative.compute.inputs.LinuxPatchSettingsArgs;
import com.pulumi.azurenative.compute.inputs.StorageProfileArgs;
import com.pulumi.azurenative.compute.inputs.ImageReferenceArgs;
import com.pulumi.azurenative.compute.inputs.OSDiskArgs;
import com.pulumi.azurenative.compute.inputs.NetworkInterfaceReferenceArgs;
import com.pulumi.azurenative.compute.inputs.ManagedDiskParametersArgs;

import com.pulumi.azurenative.sql.Server;
import com.pulumi.azurenative.sql.ServerArgs;
import com.pulumi.azurenative.sql.Database;
import com.pulumi.azurenative.sql.DatabaseArgs;
import com.pulumi.azurenative.sql.inputs.SkuArgs;

public class App {
        public static void main(String[] args) {
                Pulumi.run(ctx -> {
                        // Config config = new Config();
                        // String resourceGroup = config.require("resourceGroupName");
                        // String locationName = config.require("location");
                        var resourceGroup = "anz-devops-sre-platform-engineering-research-dev";
                        var locationName = "WestUS2";
                        var pulumiOrgProjectStack = "aleon1220/azure-enterprise-app-java/enterprise-app-networking";
                        var networkStack = new StackReference(pulumiOrgProjectStack);

                        Output<String> remoteNicId = networkStack.requireOutput("nic")
                                        .applyValue(id -> (String) id);

                        // https://www.pulumi.com/registry/packages/azure-native/api-docs/compute/virtualmachine
                        var vm = new VirtualMachine("vm", VirtualMachineArgs.builder()
                                        .resourceGroupName(resourceGroup).location(locationName)
                                        .networkProfile(NetworkProfileArgs.builder()
                                                        .networkInterfaces(
                                                                        NetworkInterfaceReferenceArgs
                                                                                        .builder()
                                                                                        .id(remoteNicId)
                                                                                        .primary(true)
                                                                                        .build())
                                                        .build())
                                        .hardwareProfile(HardwareProfileArgs.builder()
                                                        .vmSize("Standard_B2s").build())
                                        .osProfile(OSProfileArgs.builder().computerName("vm-appian-poc")
                                                        .adminUsername("azureuser")
                                                        .adminPassword("Password1234!") // Use
                                                                                        // Pulumi
                                                                                        // secrets
                                                                                        // in
                                                                                        // production!
                                                        .linuxConfiguration(LinuxConfigurationArgs
                                                                        .builder()
                                                                        .disablePasswordAuthentication(
                                                                                        false)
                                                                        .build())
                                                        .build())
                                        .storageProfile(StorageProfileArgs.builder()
                                                        .osDisk(OSDiskArgs.builder()
                                                                        .createOption("FromImage")
                                                                        .managedDisk(ManagedDiskParametersArgs
                                                                                        .builder()
                                                                                        .storageAccountType(
                                                                                                        "Standard_LRS")
                                                                                        .build())
                                                                        .build())
                                                        // https://learn.microsoft.com/en-us/azure/virtual-machines/linux/endorsed-distros
                                                        .imageReference(ImageReferenceArgs.builder()
                                                                        .publisher("almalinux")
                                                                        .offer("almalinux-x86_64")
                                                                        .sku("8-gen2")
                                                                        .version("latest").build())
                                                        .build())
                                        .build());

                        // Exports & outputs
                        ctx.export("resourceGroupName", resourceGroup);
                        ctx.export("vmId", vm.id());
                        ctx.export("output Location", Output.of(locationName));
                        ctx.export("readme",
                                        Output.of("To connect to the VM, use SSH"));
                        // ctx.export("vmPublicIP", publicIp.ipAddress());
                });
        } // end of main
} // end of class
