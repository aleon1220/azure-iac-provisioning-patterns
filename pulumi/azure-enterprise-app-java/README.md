# Azure enterprise app
a VM and SQL server DB 2022 that runs a java app for process automation

## Project Structure
the stacks of the project contain

- `/enterprise-app-networking` All the vnet details
- `/enterprise-app-services` contains the app resources itself
- `/enterprise-app-data` contains the DB and other data infra

## Get started
- Access to Azure Account
```shell
az account show --output table
```

- pulumi installed
```shell
pulumi version
```
- java JDK installed
```shell
java --version
```

- pulumi Access token
```shell
export PULUMI_ACCESS_TOKEN="https://app.pulumi.com/user/settings/tokens?filter=active"
```

- go to directory containing to code and validate
```shell
pulumi preview
```

- once ready
```shell
pulumi up
```
### VM distro selection
- choosing the azure vm image AlmaLinux
```java
    .publisher("almalinux")
    .offer("almalinux-x86_64")
    .sku("8-gen2")  // or "8-gen1" for Gen1 VMs
    .version("latest")
```

- choosing the azure vm image Linux Ubuntu
```java
    .publisher("Canonical")
    .offer("0001-com-ubuntu-server-jammy")
    .sku("22_04-lts")
    .version("latest")
```
