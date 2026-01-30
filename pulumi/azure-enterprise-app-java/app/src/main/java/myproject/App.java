package myproject;

import com.pulumi.Pulumi;

import com.pulumi.Context;
import com.pulumi.azurenative.resources.ResourceGroup;
import com.pulumi.azurenative.resources.ResourceGroupArgs;

import com.pulumi.azurenative.network.Subnet;
import com.pulumi.azurenative.network.SubnetArgs;
import com.pulumi.azurenative.network.NetworkInterface;
import com.pulumi.azurenative.network.NetworkInterfaceArgs;
import com.pulumi.azurenative.network.PublicIPAddress;
import com.pulumi.azurenative.network.VirtualNetwork;
import com.pulumi.azurenative.network.VirtualNetworkArgs;
import com.pulumi.azurenative.network.inputs.NetworkInterfaceIPConfigurationArgs;
import com.pulumi.azurenative.network.inputs.AddressSpaceArgs;
import com.pulumi.azurenative.compute.VirtualMachine;
import com.pulumi.azurenative.compute.VirtualMachineArgs;
import com.pulumi.azurenative.compute.inputs.*;

import com.pulumi.azurenative.sql.Server;
import com.pulumi.azurenative.sql.ServerArgs;
import com.pulumi.azurenative.sql.Database;
import com.pulumi.azurenative.sql.DatabaseArgs;
import com.pulumi.azurenative.sql.inputs.SkuArgs;
import com.pulumi.core.Output;

import java.util.List;

public class App {
        public static void main(String[] args) {
                Pulumi.run(ctx -> {
                        // Config config = new Config();
                        // String resourceGroup = config.require("resourceGroupName");
                        // String locationName = config.require("location");
                        var resourceGroup = "anz-devops-sre-platform-engineering-research-dev";
                        var locationName = "WestUS2";

                        // Create a virtual network
                        var vnet = new VirtualNetwork("vnet", VirtualNetworkArgs.builder()
                                        .resourceGroupName(resourceGroup).location(locationName)
                                        .addressSpace(AddressSpaceArgs.builder()
                                                        .addressPrefixes("10.0.0.0/16").build())
                                        .build());

                        // Create a subnet
                        var subnet = new Subnet("subnet",
                                        SubnetArgs.builder().resourceGroupName(resourceGroup)
                                                        .virtualNetworkName(vnet.name())
                                                        .addressPrefix("10.0.1.0/24").build());

                        // Create a network interface
                        var nic = new NetworkInterface("nic", NetworkInterfaceArgs.builder()
                                        .resourceGroupName(resourceGroup).location(locationName)
                                        .ipConfigurations(
                                                        List.of(NetworkInterfaceIPConfigurationArgs
                                                                        .builder().name("ipconfig1")
                                                                        .subnet(com.pulumi.azurenative.network.inputs.SubnetArgs
                                                                                        .builder()
                                                                                        .id(subnet.id())
                                                                                        .build())
                                                                        .privateIPAllocationMethod(
                                                                                        "Dynamic")
                                                                        .build()))
                                        .build());

                        // Create the virtual machine
                        var vm = new VirtualMachine("vm", VirtualMachineArgs.builder()
                                        .resourceGroupName(resourceGroup).location(locationName)
                                        .networkProfile(NetworkProfileArgs.builder()
                                                        .networkInterfaces(
                                                                        NetworkInterfaceReferenceArgs
                                                                                        .builder()
                                                                                        .id(nic.id())
                                                                                        .primary(true)
                                                                                        .build())
                                                        .build())
                                        .hardwareProfile(HardwareProfileArgs.builder()
                                                        .vmSize("Standard_B2s").build())
                                        .osProfile(OSProfileArgs.builder().computerName("myvm")
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

                        // Export the VM's ID
                        ctx.export("vmId", vm.id());
                        ctx.export("resourceGroupName", resourceGroup);

                        // Exports section
                        ctx.export("exampleOutput", Output.of("Example Output"));
                        // ctx.export("vmPublicIP", publicIp.ipAddress());
                });
        }
}
