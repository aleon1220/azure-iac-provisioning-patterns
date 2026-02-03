# Azure enterprise app
a VM and SQL server DB 2022 that runs a java app for process automation

- choosing the azure vm image AlmaLinux
``java
    .publisher("almalinux")
    .offer("almalinux-x86_64")
    .sku("8-gen2")  // or "8-gen1" for Gen1 VMs
    .version("latest")
```

- choosing the azure vm image Linux Ubuntu
``java
    .publisher("Canonical")
    .offer("0001-com-ubuntu-server-jammy")
    .sku("22_04-lts")
    .version("latest")
```

# Project Structure
the stacks of the project contain

- `/enterprise-app-networking` All the vnet details
- `/enterprise-app-services` contains the app resources itself
- `/enterprise-app-data` contains the DB and other data infra
