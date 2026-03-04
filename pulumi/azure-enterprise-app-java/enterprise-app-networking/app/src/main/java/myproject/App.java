package myproject;

import java.util.List;

import com.pulumi.Pulumi;
import com.pulumi.Context;

import com.pulumi.azurenative.network.Subnet;
import com.pulumi.azurenative.network.SubnetArgs;
import com.pulumi.azurenative.network.NetworkInterface;
import com.pulumi.azurenative.network.NetworkInterfaceArgs;
import com.pulumi.azurenative.network.VirtualNetwork;
import com.pulumi.azurenative.network.VirtualNetworkArgs;
import com.pulumi.azurenative.network.inputs.NetworkInterfaceIPConfigurationArgs;
import com.pulumi.azurenative.network.inputs.AddressSpaceArgs;

public class App {
        public static void main(String[] args) {
                Pulumi.run(ctx -> {
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

                        // Export outputs
                        ctx.export("output vnet name", vnet.name());
                        ctx.export("output Subnet Name", subnet.name());
                        ctx.export("output Subnet Address Prefix", subnet.addressPrefix());
                        ctx.export("output NIC Network Interface Card name", nic.name());
                        ctx.export("nic", nic.id());
                });
        } // end of main
} // end of class
