@secure()
param vulnerabilityAssessments_Default_storageContainerPath string
param metricAlerts_HighCPU_name string
param virtualMachines_WS_VM1_name string
param sites_websiteq7efyqm4edbxa_name string
param actionGroups_NotifyCPU_name string
param virtualMachines_Linux_VM2_name string
param networkInterfaces_ws_vm125_name string
param servers_sqlserverq7efyqm4edbxa_name string
param publicIPAddresses_WS_VM1_ip_name string
param virtualNetworks_vnet_eastus_name string
param sites_AzureLinuxAppZZ777_webapp_name string
param dataCollectionRules_WinVMDCR_name string
param virtualNetworks_vnet_eastus_1_name string
param networkInterfaces_linux_vm2528_name string
param publicIPAddresses_Linux_VM2_ip_name string
param networkSecurityGroups_WS_VM1_nsg_name string
param serverfarms_hostingplanq7efyqm4edbxa_name string
param dataCollectionRules_DCR_Linux_VM_name string
param networkSecurityGroups_Linux_VM2_nsg_name string
param workspaces_LogAnalytics1_name string
param components_AzureLinuxAppZZ777_webapp_name string
param serverfarms_AppServicePlan_AzureLinuxAppZZ777_name string
param dataCollectionEndpoints_IaaSVMCollectionEndpoint_name string
param smartdetectoralertrules_failure_anomalies_azurelinuxappzz777_webapp_name string
param actiongroups_application_insights_smart_detection_externalid string

// Resources created 2026-01-26
// prep for Learning Path Deploy and configure Azure Monitor

resource actionGroups_NotifyCPU_name_resource 'microsoft.insights/actionGroups@2024-10-01-preview' = {
  name: actionGroups_NotifyCPU_name
  location: 'Global'
  properties: {
    groupShortName: 'Notify CPU'
    enabled: true
    emailReceivers: [
      {
        name: 'NotificationEmail_-EmailAction-'
        emailAddress: 'prime@fabrikam.com'
        useCommonAlertSchema: false
      }
    ]
    smsReceivers: [
      {
        name: 'NotificationEmail_-SMSAction-'
        countryCode: '64'
        phoneNumber: '274981162'
      }
    ]
    webhookReceivers: []
    eventHubReceivers: []
    itsmReceivers: []
    azureAppPushReceivers: []
    automationRunbookReceivers: []
    voiceReceivers: []
    logicAppReceivers: []
    azureFunctionReceivers: []
    armRoleReceivers: []
  }
}

resource dataCollectionEndpoints_IaaSVMCollectionEndpoint_name_resource 'Microsoft.Insights/dataCollectionEndpoints@2023-03-11' = {
  name: dataCollectionEndpoints_IaaSVMCollectionEndpoint_name
  location: 'eastus'
  properties: {
    immutableId: 'dce-dfe4bb16690f43d8a12012412e908fb7'
    configurationAccess: {}
    logsIngestion: {}
    metricsIngestion: {}
    networkAcls: {
      publicNetworkAccess: 'Enabled'
    }
  }
}

resource networkSecurityGroups_Linux_VM2_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2024-07-01' = {
  name: networkSecurityGroups_Linux_VM2_nsg_name
  location: 'eastus'
  properties: {
    securityRules: []
  }
}

resource networkSecurityGroups_WS_VM1_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2024-07-01' = {
  name: networkSecurityGroups_WS_VM1_nsg_name
  location: 'eastus'
  tags: {
    purpose: 'Deploy and configure Azure Monitor'
  }
  properties: {
    securityRules: [
      {
        name: 'RDP'
        id: networkSecurityGroups_WS_VM1_nsg_name_RDP.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: '116.251.131.142'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 300
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowAnyHTTPInbound'
        id: networkSecurityGroups_WS_VM1_nsg_name_AllowAnyHTTPInbound.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          description: 'AllowAnyHTTPInbound'
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '80'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 310
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource publicIPAddresses_Linux_VM2_ip_name_resource 'Microsoft.Network/publicIPAddresses@2024-07-01' = {
  name: publicIPAddresses_Linux_VM2_ip_name
  location: 'eastus'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '40.117.251.141'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
    ddosSettings: {
      protectionMode: 'VirtualNetworkInherited'
    }
  }
}

resource publicIPAddresses_WS_VM1_ip_name_resource 'Microsoft.Network/publicIPAddresses@2024-07-01' = {
  name: publicIPAddresses_WS_VM1_ip_name
  location: 'eastus'
  tags: {
    purpose: 'Deploy and configure Azure Monitor'
  }
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '20.106.243.117'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
    ddosSettings: {
      protectionMode: 'VirtualNetworkInherited'
    }
  }
}

resource virtualNetworks_vnet_eastus_name_resource 'Microsoft.Network/virtualNetworks@2024-07-01' = {
  name: virtualNetworks_vnet_eastus_name
  location: 'eastus'
  tags: {
    purpose: 'Deploy and configure Azure Monitor'
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        '172.16.0.0/16'
      ]
    }
    privateEndpointVNetPolicies: 'Disabled'
    subnets: [
      {
        name: 'snet-eastus-1'
        id: virtualNetworks_vnet_eastus_name_snet_eastus_1.id
        properties: {
          addressPrefixes: [
            '172.16.0.0/24'
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource virtualNetworks_vnet_eastus_1_name_resource 'Microsoft.Network/virtualNetworks@2024-07-01' = {
  name: virtualNetworks_vnet_eastus_1_name
  location: 'eastus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '172.17.0.0/16'
      ]
    }
    privateEndpointVNetPolicies: 'Disabled'
    subnets: [
      {
        name: 'snet-eastus-1'
        id: virtualNetworks_vnet_eastus_1_name_snet_eastus_1.id
        properties: {
          addressPrefixes: [
            '172.17.0.0/24'
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource workspaces_LogAnalytics1_name_resource 'Microsoft.OperationalInsights/workspaces@2025-02-01' = {
  name: workspaces_LogAnalytics1_name
  location: 'eastus'
  properties: {
    sku: {
      name: 'pergb2018'
    }
    retentionInDays: 60
    features: {
      legacy: 0
      searchVersion: 1
      enableLogAccessUsingOnlyResourcePermissions: true
    }
    workspaceCapping: {
      dailyQuotaGb: json('10')
    }
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource servers_sqlserverq7efyqm4edbxa_name_resource 'Microsoft.Sql/servers@2024-05-01-preview' = {
  name: servers_sqlserverq7efyqm4edbxa_name
  location: 'eastus'
  tags: {
    displayName: 'SQL Server'
  }
  kind: 'v12.0'
  properties: {
    administratorLogin: 'prime'
    version: '12.0'
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Enabled'
    restrictOutboundNetworkAccess: 'Disabled'
  }
}

resource serverfarms_AppServicePlan_AzureLinuxAppZZ777_name_resource 'Microsoft.Web/serverfarms@2024-11-01' = {
  name: serverfarms_AppServicePlan_AzureLinuxAppZZ777_name
  location: 'East US'
  sku: {
    name: 'S1'
    tier: 'Standard'
    size: 'S1'
    family: 'S'
    capacity: 1
  }
  kind: 'linux'
  properties: {
    perSiteScaling: false
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: true
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: false
    asyncScalingEnabled: false
  }
}

resource serverfarms_hostingplanq7efyqm4edbxa_name_resource 'Microsoft.Web/serverfarms@2024-11-01' = {
  name: serverfarms_hostingplanq7efyqm4edbxa_name
  location: 'East US'
  tags: {
    displayName: 'HostingPlan'
  }
  sku: {
    name: 'F1'
    tier: 'Free'
    size: 'F1'
    family: 'F'
    capacity: 0
  }
  kind: 'app'
  properties: {
    perSiteScaling: false
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: false
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: false
    asyncScalingEnabled: false
  }
}

resource smartdetectoralertrules_failure_anomalies_azurelinuxappzz777_webapp_name_resource 'microsoft.alertsmanagement/smartdetectoralertrules@2021-04-01' = {
  name: smartdetectoralertrules_failure_anomalies_azurelinuxappzz777_webapp_name
  location: 'global'
  properties: {
    description: 'Failure Anomalies notifies you of an unusual rise in the rate of failed HTTP requests or dependency calls.'
    state: 'Enabled'
    severity: 'Sev3'
    frequency: 'PT1M'
    detector: {
      id: 'FailureAnomaliesDetector'
    }
    scope: [
      components_AzureLinuxAppZZ777_webapp_name_resource.id
    ]
    actionGroups: {
      groupIds: [
        actiongroups_application_insights_smart_detection_externalid
      ]
    }
  }
}

resource virtualMachines_Linux_VM2_name_resource 'Microsoft.Compute/virtualMachines@2024-11-01' = {
  name: virtualMachines_Linux_VM2_name
  location: 'eastus'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_DS1_v2'
    }
    additionalCapabilities: {
      hibernationEnabled: false
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: '0001-com-ubuntu-server-jammy'
        sku: '22_04-lts-gen2'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_Linux_VM2_name}_OsDisk_1_b28263b33ffd4100a8773a58166bf9d4'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
          id: resourceId(
            'Microsoft.Compute/disks',
            '${virtualMachines_Linux_VM2_name}_OsDisk_1_b28263b33ffd4100a8773a58166bf9d4'
          )
        }
        deleteOption: 'Delete'
        diskSizeGB: 30
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_Linux_VM2_name
      adminUsername: 'Prime'
      linuxConfiguration: {
        disablePasswordAuthentication: false
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'AutomaticByPlatform'
          automaticByPlatformSettings: {
            rebootSetting: 'IfRequired'
          }
          assessmentMode: 'ImageDefault'
        }
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    securityProfile: {
      uefiSettings: {
        secureBootEnabled: true
        vTpmEnabled: true
      }
      securityType: 'TrustedLaunch'
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_linux_vm2528_name_resource.id
          properties: {
            deleteOption: 'Detach'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

resource virtualMachines_WS_VM1_name_resource 'Microsoft.Compute/virtualMachines@2024-11-01' = {
  name: virtualMachines_WS_VM1_name
  location: 'eastus'
  tags: {
    purpose: 'Deploy and configure Azure Monitor'
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_DS1_v2'
    }
    additionalCapabilities: {
      hibernationEnabled: false
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2022-datacenter-azure-edition-hotpatch'
        version: 'latest'
      }
      osDisk: {
        osType: 'Windows'
        name: '${virtualMachines_WS_VM1_name}_OsDisk_1_531176e9948542169383ca63d171bc40'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
          id: resourceId(
            'Microsoft.Compute/disks',
            '${virtualMachines_WS_VM1_name}_OsDisk_1_531176e9948542169383ca63d171bc40'
          )
        }
        deleteOption: 'Delete'
        diskSizeGB: 127
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_WS_VM1_name
      adminUsername: 'prime'
      windowsConfiguration: {
        provisionVMAgent: true
        enableAutomaticUpdates: true
        patchSettings: {
          patchMode: 'AutomaticByPlatform'
          automaticByPlatformSettings: {
            rebootSetting: 'IfRequired'
          }
          assessmentMode: 'ImageDefault'
          enableHotpatching: true
        }
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_ws_vm125_name_resource.id
          properties: {
            deleteOption: 'Detach'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

resource virtualMachines_Linux_VM2_name_AzureNetworkWatcherExtension 'Microsoft.Compute/virtualMachines/extensions@2024-11-01' = {
  parent: virtualMachines_Linux_VM2_name_resource
  name: 'AzureNetworkWatcherExtension'
  location: 'eastus'
  properties: {
    autoUpgradeMinorVersion: true
    publisher: 'Microsoft.Azure.NetworkWatcher'
    type: 'NetworkWatcherAgentLinux'
    typeHandlerVersion: '1.4'
  }
}

resource components_AzureLinuxAppZZ777_webapp_name_resource 'microsoft.insights/components@2020-02-02' = {
  name: components_AzureLinuxAppZZ777_webapp_name
  location: 'eastus'
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Redfield'
    Request_Source: 'IbizaAIExtensionEnablementBlade'
    RetentionInDays: 90
    WorkspaceResourceId: workspaces_LogAnalytics1_name_resource.id
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource components_AzureLinuxAppZZ777_webapp_name_degradationindependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_AzureLinuxAppZZ777_webapp_name_resource
  name: 'degradationindependencyduration'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'degradationindependencyduration'
      DisplayName: 'Degradation in dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_AzureLinuxAppZZ777_webapp_name_degradationinserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_AzureLinuxAppZZ777_webapp_name_resource
  name: 'degradationinserverresponsetime'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'degradationinserverresponsetime'
      DisplayName: 'Degradation in server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_AzureLinuxAppZZ777_webapp_name_digestMailConfiguration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_AzureLinuxAppZZ777_webapp_name_resource
  name: 'digestMailConfiguration'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'digestMailConfiguration'
      DisplayName: 'Digest Mail Configuration'
      Description: 'This rule describes the digest mail preferences'
      HelpUrl: 'www.homail.com'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_AzureLinuxAppZZ777_webapp_name_extension_billingdatavolumedailyspikeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_AzureLinuxAppZZ777_webapp_name_resource
  name: 'extension_billingdatavolumedailyspikeextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_billingdatavolumedailyspikeextension'
      DisplayName: 'Abnormal rise in daily data volume (preview)'
      Description: 'This detection rule automatically analyzes the billing data generated by your application, and can warn you about an unusual increase in your application\'s billing costs'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/billing-data-volume-daily-spike.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_AzureLinuxAppZZ777_webapp_name_extension_canaryextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_AzureLinuxAppZZ777_webapp_name_resource
  name: 'extension_canaryextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_canaryextension'
      DisplayName: 'Canary extension'
      Description: 'Canary extension'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_AzureLinuxAppZZ777_webapp_name_extension_exceptionchangeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_AzureLinuxAppZZ777_webapp_name_resource
  name: 'extension_exceptionchangeextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_exceptionchangeextension'
      DisplayName: 'Abnormal rise in exception volume (preview)'
      Description: 'This detection rule automatically analyzes the exceptions thrown in your application, and can warn you about unusual patterns in your exception telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/abnormal-rise-in-exception-volume.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_AzureLinuxAppZZ777_webapp_name_extension_memoryleakextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_AzureLinuxAppZZ777_webapp_name_resource
  name: 'extension_memoryleakextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_memoryleakextension'
      DisplayName: 'Potential memory leak detected (preview)'
      Description: 'This detection rule automatically analyzes the memory consumption of each process in your application, and can warn you about potential memory leaks or increased memory consumption.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/memory-leak.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_AzureLinuxAppZZ777_webapp_name_extension_securityextensionspackage 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_AzureLinuxAppZZ777_webapp_name_resource
  name: 'extension_securityextensionspackage'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_securityextensionspackage'
      DisplayName: 'Potential security issue detected (preview)'
      Description: 'This detection rule automatically analyzes the telemetry generated by your application and detects potential security issues.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/application-security-detection-pack.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_AzureLinuxAppZZ777_webapp_name_extension_traceseveritydetector 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_AzureLinuxAppZZ777_webapp_name_resource
  name: 'extension_traceseveritydetector'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_traceseveritydetector'
      DisplayName: 'Degradation in trace severity ratio (preview)'
      Description: 'This detection rule automatically analyzes the trace logs emitted from your application, and can warn you about unusual patterns in the severity of your trace telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/degradation-in-trace-severity-ratio.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_AzureLinuxAppZZ777_webapp_name_longdependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_AzureLinuxAppZZ777_webapp_name_resource
  name: 'longdependencyduration'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'longdependencyduration'
      DisplayName: 'Long dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_AzureLinuxAppZZ777_webapp_name_migrationToAlertRulesCompleted 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_AzureLinuxAppZZ777_webapp_name_resource
  name: 'migrationToAlertRulesCompleted'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'migrationToAlertRulesCompleted'
      DisplayName: 'Migration To Alert Rules Completed'
      Description: 'A configuration that controls the migration state of Smart Detection to Smart Alerts'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: true
      IsEnabledByDefault: false
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: false
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_AzureLinuxAppZZ777_webapp_name_slowpageloadtime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_AzureLinuxAppZZ777_webapp_name_resource
  name: 'slowpageloadtime'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'slowpageloadtime'
      DisplayName: 'Slow page load time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_AzureLinuxAppZZ777_webapp_name_slowserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_AzureLinuxAppZZ777_webapp_name_resource
  name: 'slowserverresponsetime'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'slowserverresponsetime'
      DisplayName: 'Slow server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource dataCollectionRules_DCR_Linux_VM_name_resource 'Microsoft.Insights/dataCollectionRules@2023-03-11' = {
  name: dataCollectionRules_DCR_Linux_VM_name
  location: 'eastus'
  properties: {
    streamDeclarations: {}
    dataSources: {
      performanceCounters: [
        {
          streams: [
            'Microsoft-Perf'
          ]
          samplingFrequencyInSeconds: 60
          counterSpecifiers: [
            '\\Processor Information(_Total)\\% Processor Time'
            '\\Processor Information(_Total)\\% Privileged Time'
            '\\Processor Information(_Total)\\% User Time'
            '\\Processor Information(_Total)\\Processor Frequency'
            '\\System\\Processes'
            '\\Process(_Total)\\Thread Count'
            '\\Process(_Total)\\Handle Count'
            '\\System\\System Up Time'
            '\\System\\Context Switches/sec'
            '\\System\\Processor Queue Length'
            '\\Memory\\% Committed Bytes In Use'
            '\\Memory\\Available Bytes'
            '\\Memory\\Committed Bytes'
            '\\Memory\\Cache Bytes'
            '\\Memory\\Pool Paged Bytes'
            '\\Memory\\Pool Nonpaged Bytes'
            '\\Memory\\Pages/sec'
            '\\Memory\\Page Faults/sec'
            '\\Process(_Total)\\Working Set'
            '\\Process(_Total)\\Working Set - Private'
            '\\LogicalDisk(_Total)\\% Disk Time'
            '\\LogicalDisk(_Total)\\% Disk Read Time'
            '\\LogicalDisk(_Total)\\% Disk Write Time'
            '\\LogicalDisk(_Total)\\% Idle Time'
            '\\LogicalDisk(_Total)\\Disk Bytes/sec'
            '\\LogicalDisk(_Total)\\Disk Read Bytes/sec'
            '\\LogicalDisk(_Total)\\Disk Write Bytes/sec'
            '\\LogicalDisk(_Total)\\Disk Transfers/sec'
            '\\LogicalDisk(_Total)\\Disk Reads/sec'
            '\\LogicalDisk(_Total)\\Disk Writes/sec'
            '\\LogicalDisk(_Total)\\Avg. Disk sec/Transfer'
            '\\LogicalDisk(_Total)\\Avg. Disk sec/Read'
            '\\LogicalDisk(_Total)\\Avg. Disk sec/Write'
            '\\LogicalDisk(_Total)\\Avg. Disk Queue Length'
            '\\LogicalDisk(_Total)\\Avg. Disk Read Queue Length'
            '\\LogicalDisk(_Total)\\Avg. Disk Write Queue Length'
            '\\LogicalDisk(_Total)\\% Free Space'
            '\\LogicalDisk(_Total)\\Free Megabytes'
            '\\Network Interface(*)\\Bytes Total/sec'
            '\\Network Interface(*)\\Bytes Sent/sec'
            '\\Network Interface(*)\\Bytes Received/sec'
            '\\Network Interface(*)\\Packets/sec'
            '\\Network Interface(*)\\Packets Sent/sec'
            '\\Network Interface(*)\\Packets Received/sec'
            '\\Network Interface(*)\\Packets Outbound Errors'
            '\\Network Interface(*)\\Packets Received Errors'
            'Processor(*)\\% Processor Time'
            'Processor(*)\\% Idle Time'
            'Processor(*)\\% User Time'
            'Processor(*)\\% Nice Time'
            'Processor(*)\\% Privileged Time'
            'Processor(*)\\% IO Wait Time'
            'Processor(*)\\% Interrupt Time'
            'Memory(*)\\Available MBytes Memory'
            'Memory(*)\\% Available Memory'
            'Memory(*)\\Used Memory MBytes'
            'Memory(*)\\% Used Memory'
            'Memory(*)\\Pages/sec'
            'Memory(*)\\Page Reads/sec'
            'Memory(*)\\Page Writes/sec'
            'Memory(*)\\Available MBytes Swap'
            'Memory(*)\\% Available Swap Space'
            'Memory(*)\\Used MBytes Swap Space'
            'Memory(*)\\% Used Swap Space'
            'Process(*)\\Pct User Time'
            'Process(*)\\Pct Privileged Time'
            'Process(*)\\Used Memory'
            'Process(*)\\Virtual Shared Memory'
            'Logical Disk(*)\\% Free Inodes'
            'Logical Disk(*)\\% Used Inodes'
            'Logical Disk(*)\\Free Megabytes'
            'Logical Disk(*)\\% Free Space'
            'Logical Disk(*)\\% Used Space'
            'Logical Disk(*)\\Logical Disk Bytes/sec'
            'Logical Disk(*)\\Disk Read Bytes/sec'
            'Logical Disk(*)\\Disk Write Bytes/sec'
            'Logical Disk(*)\\Disk Transfers/sec'
            'Logical Disk(*)\\Disk Reads/sec'
            'Logical Disk(*)\\Disk Writes/sec'
            'Network(*)\\Total Bytes Transmitted'
            'Network(*)\\Total Bytes Received'
            'Network(*)\\Total Bytes'
            'Network(*)\\Total Packets Transmitted'
            'Network(*)\\Total Packets Received'
            'Network(*)\\Total Rx Errors'
            'Network(*)\\Total Tx Errors'
            'Network(*)\\Total Collisions'
            'System(*)\\Uptime'
            'System(*)\\Load1'
            'System(*)\\Load5'
            'System(*)\\Load15'
            'System(*)\\Users'
            'System(*)\\Unique Users'
            'System(*)\\CPUs'
          ]
          name: 'perfCounterDataSource60'
        }
      ]
    }
    destinations: {
      logAnalytics: [
        {
          workspaceResourceId: workspaces_LogAnalytics1_name_resource.id
          name: 'la--1808026071'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Microsoft-Perf'
        ]
        destinations: [
          'la--1808026071'
        ]
        transformKql: 'source'
        outputStream: 'Microsoft-Perf'
      }
    ]
  }
}

resource networkSecurityGroups_WS_VM1_nsg_name_AllowAnyHTTPInbound 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_WS_VM1_nsg_name}/AllowAnyHTTPInbound'
  properties: {
    description: 'AllowAnyHTTPInbound'
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '80'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 310
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_WS_VM1_nsg_name_resource
  ]
}

resource networkSecurityGroups_WS_VM1_nsg_name_RDP 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_WS_VM1_nsg_name}/RDP'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '3389'
    sourceAddressPrefix: '116.251.131.142'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 300
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_WS_VM1_nsg_name_resource
  ]
}

resource virtualNetworks_vnet_eastus_name_snet_eastus_1 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
  name: '${virtualNetworks_vnet_eastus_name}/snet-eastus-1'
  properties: {
    addressPrefixes: [
      '172.16.0.0/24'
    ]
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_eastus_name_resource
  ]
}

resource virtualNetworks_vnet_eastus_1_name_snet_eastus_1 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
  name: '${virtualNetworks_vnet_eastus_1_name}/snet-eastus-1'
  properties: {
    addressPrefixes: [
      '172.17.0.0/24'
    ]
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_eastus_1_name_resource
  ]
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_General_AlphabeticallySortedComputers 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_General|AlphabeticallySortedComputers'
  properties: {
    category: 'General Exploration'
    displayName: 'All Computers with their most recent data'
    version: 2
    query: 'search not(ObjectName == "Advisor Metrics" or ObjectName == "ManagedSpace") | summarize AggregatedValue = max(TimeGenerated) by Computer | limit 500000 | sort by Computer asc\r\n// Oql: NOT(ObjectName="Advisor Metrics" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) by Computer | top 500000 | Sort Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_General_dataPointsPerManagementGroup 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_General|dataPointsPerManagementGroup'
  properties: {
    category: 'General Exploration'
    displayName: 'Which Management Group is generating the most data points?'
    version: 2
    query: 'search * | summarize AggregatedValue = count() by ManagementGroupName\r\n// Oql: * | Measure count() by ManagementGroupName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_General_dataTypeDistribution 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_General|dataTypeDistribution'
  properties: {
    category: 'General Exploration'
    displayName: 'Distribution of data Types'
    version: 2
    query: 'search * | extend Type = $table | summarize AggregatedValue = count() by Type\r\n// Oql: * | Measure count() by Type // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_General_StaleComputers 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_General|StaleComputers'
  properties: {
    category: 'General Exploration'
    displayName: 'Stale Computers (data older than 24 hours)'
    version: 2
    query: 'search not(ObjectName == "Advisor Metrics" or ObjectName == "ManagedSpace") | summarize lastdata = max(TimeGenerated) by Computer | limit 500000 | where lastdata < ago(24h)\r\n// Oql: NOT(ObjectName="Advisor Metrics" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) as lastdata by Computer | top 500000 | where lastdata < NOW-24HOURS // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_AllEvents 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|AllEvents'
  properties: {
    category: 'Log Management'
    displayName: 'All Events'
    version: 2
    query: 'Event | sort by TimeGenerated desc\r\n// Oql: Type=Event // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_AllSyslog 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|AllSyslog'
  properties: {
    category: 'Log Management'
    displayName: 'All Syslogs'
    version: 2
    query: 'Syslog | sort by TimeGenerated desc\r\n// Oql: Type=Syslog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_AllSyslogByFacility 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|AllSyslogByFacility'
  properties: {
    category: 'Log Management'
    displayName: 'All Syslog Records grouped by Facility'
    version: 2
    query: 'Syslog | summarize AggregatedValue = count() by Facility\r\n// Oql: Type=Syslog | Measure count() by Facility // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_AllSyslogByProcess 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|AllSyslogByProcessName'
  properties: {
    category: 'Log Management'
    displayName: 'All Syslog Records grouped by ProcessName'
    version: 2
    query: 'Syslog | summarize AggregatedValue = count() by ProcessName\r\n// Oql: Type=Syslog | Measure count() by ProcessName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_AllSyslogsWithErrors 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|AllSyslogsWithErrors'
  properties: {
    category: 'Log Management'
    displayName: 'All Syslog Records with Errors'
    version: 2
    query: 'Syslog | where SeverityLevel == "error" | sort by TimeGenerated desc\r\n// Oql: Type=Syslog SeverityLevel=error // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_AverageHTTPRequestTimeByClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|AverageHTTPRequestTimeByClientIPAddress'
  properties: {
    category: 'Log Management'
    displayName: 'Average HTTP Request time by Client IP Address'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by cIP\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_AverageHTTPRequestTimeHTTPMethod 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|AverageHTTPRequestTimeHTTPMethod'
  properties: {
    category: 'Log Management'
    displayName: 'Average HTTP Request time by HTTP Method'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by csMethod\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_CountIISLogEntriesClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|CountIISLogEntriesClientIPAddress'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by Client IP Address'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by cIP\r\n// Oql: Type=W3CIISLog | Measure count() by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_CountIISLogEntriesHTTPRequestMethod 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|CountIISLogEntriesHTTPRequestMethod'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by HTTP Request Method'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csMethod\r\n// Oql: Type=W3CIISLog | Measure count() by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_CountIISLogEntriesHTTPUserAgent 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|CountIISLogEntriesHTTPUserAgent'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by HTTP User Agent'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUserAgent\r\n// Oql: Type=W3CIISLog | Measure count() by csUserAgent // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_CountOfIISLogEntriesByHostRequestedByClient 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|CountOfIISLogEntriesByHostRequestedByClient'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by Host requested by client'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csHost\r\n// Oql: Type=W3CIISLog | Measure count() by csHost // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_CountOfIISLogEntriesByURLForHost 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|CountOfIISLogEntriesByURLForHost'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by URL for the host "www.contoso.com" (replace with your own)'
    version: 2
    query: 'search csHost == "www.contoso.com" | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog csHost="www.contoso.com" | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_CountOfIISLogEntriesByURLRequestedByClient 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|CountOfIISLogEntriesByURLRequestedByClient'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by URL requested by client (without query strings)'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_CountOfWarningEvents 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|CountOfWarningEvents'
  properties: {
    category: 'Log Management'
    displayName: 'Count of Events with level "Warning" grouped by Event ID'
    version: 2
    query: 'Event | where EventLevelName == "warning" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event EventLevelName=warning | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_DisplayBreakdownRespondCodes 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|DisplayBreakdownRespondCodes'
  properties: {
    category: 'Log Management'
    displayName: 'Shows breakdown of response codes'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by scStatus\r\n// Oql: Type=W3CIISLog | Measure count() by scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_EventsByEventLog 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|EventsByEventLog'
  properties: {
    category: 'Log Management'
    displayName: 'Count of Events grouped by Event Log'
    version: 2
    query: 'Event | summarize AggregatedValue = count() by EventLog\r\n// Oql: Type=Event | Measure count() by EventLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_EventsByEventsID 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|EventsByEventsID'
  properties: {
    category: 'Log Management'
    displayName: 'Count of Events grouped by Event ID'
    version: 2
    query: 'Event | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_EventsByEventSource 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|EventsByEventSource'
  properties: {
    category: 'Log Management'
    displayName: 'Count of Events grouped by Event Source'
    version: 2
    query: 'Event | summarize AggregatedValue = count() by Source\r\n// Oql: Type=Event | Measure count() by Source // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_EventsInOMBetween2000to3000 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|EventsInOMBetween2000to3000'
  properties: {
    category: 'Log Management'
    displayName: 'Events in the Operations Manager Event Log whose Event ID is in the range between 2000 and 3000'
    version: 2
    query: 'Event | where EventLog == "Operations Manager" and EventID >= 2000 and EventID <= 3000 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog="Operations Manager" EventID:[2000..3000] // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_EventsWithStartedinEventID 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|EventsWithStartedinEventID'
  properties: {
    category: 'Log Management'
    displayName: 'Count of Events containing the word "started" grouped by EventID'
    version: 2
    query: 'search in (Event) "started" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event "started" | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_FindMaximumTimeTakenForEachPage 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|FindMaximumTimeTakenForEachPage'
  properties: {
    category: 'Log Management'
    displayName: 'Find the maximum time taken for each page'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = max(TimeTaken) by csUriStem\r\n// Oql: Type=W3CIISLog | Measure Max(TimeTaken) by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_IISLogEntriesForClientIP 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|IISLogEntriesForClientIP'
  properties: {
    category: 'Log Management'
    displayName: 'IIS Log Entries for a specific client IP Address (replace with your own)'
    version: 2
    query: 'search cIP == "192.168.0.1" | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc | project csUriStem, scBytes, csBytes, TimeTaken, scStatus\r\n// Oql: Type=W3CIISLog cIP="192.168.0.1" | Select csUriStem,scBytes,csBytes,TimeTaken,scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_ListAllIISLogEntries 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|ListAllIISLogEntries'
  properties: {
    category: 'Log Management'
    displayName: 'All IIS Log Entries'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc\r\n// Oql: Type=W3CIISLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_NoOfConnectionsToOMSDKService 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|NoOfConnectionsToOMSDKService'
  properties: {
    category: 'Log Management'
    displayName: 'How many connections to Operations Manager\'s SDK service by day'
    version: 2
    query: 'Event | where EventID == 26328 and EventLog == "Operations Manager" | summarize AggregatedValue = count() by bin(TimeGenerated, 1d) | sort by TimeGenerated desc\r\n// Oql: Type=Event EventID=26328 EventLog="Operations Manager" | Measure count() interval 1DAY // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_ServerRestartTime 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|ServerRestartTime'
  properties: {
    category: 'Log Management'
    displayName: 'When did my servers initiate restart?'
    version: 2
    query: 'search in (Event) "shutdown" and EventLog == "System" and Source == "User32" and EventID == 1074 | sort by TimeGenerated desc | project TimeGenerated, Computer\r\n// Oql: shutdown Type=Event EventLog=System Source=User32 EventID=1074 | Select TimeGenerated,Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_Show404PagesList 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|Show404PagesList'
  properties: {
    category: 'Log Management'
    displayName: 'Shows which pages people are getting a 404 for'
    version: 2
    query: 'search scStatus == 404 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog scStatus=404 | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_ShowServersThrowingInternalServerError 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|ShowServersThrowingInternalServerError'
  properties: {
    category: 'Log Management'
    displayName: 'Shows servers that are throwing internal server error'
    version: 2
    query: 'search scStatus == 500 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by sComputerName\r\n// Oql: Type=W3CIISLog scStatus=500 | Measure count() by sComputerName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_TotalBytesReceivedByEachAzureRoleInstance 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|TotalBytesReceivedByEachAzureRoleInstance'
  properties: {
    category: 'Log Management'
    displayName: 'Total Bytes received by each Azure Role Instance'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by RoleInstance\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by RoleInstance // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_TotalBytesReceivedByEachIISComputer 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|TotalBytesReceivedByEachIISComputer'
  properties: {
    category: 'Log Management'
    displayName: 'Total Bytes received by each IIS Computer'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by Computer | limit 500000\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_TotalBytesRespondedToClientsByClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|TotalBytesRespondedToClientsByClientIPAddress'
  properties: {
    category: 'Log Management'
    displayName: 'Total Bytes responded back to clients by Client IP Address'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_TotalBytesRespondedToClientsByEachIISServerIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|TotalBytesRespondedToClientsByEachIISServerIPAddress'
  properties: {
    category: 'Log Management'
    displayName: 'Total Bytes responded back to clients by each IIS ServerIP Address'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by sIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by sIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_TotalBytesSentByClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|TotalBytesSentByClientIPAddress'
  properties: {
    category: 'Log Management'
    displayName: 'Total Bytes sent by Client IP Address'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_WarningEvents 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|WarningEvents'
  properties: {
    category: 'Log Management'
    displayName: 'All Events with level "Warning"'
    version: 2
    query: 'Event | where EventLevelName == "warning" | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLevelName=warning // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_WindowsFireawallPolicySettingsChanged 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|WindowsFireawallPolicySettingsChanged'
  properties: {
    category: 'Log Management'
    displayName: 'Windows Firewall Policy settings have changed'
    version: 2
    query: 'Event | where EventLog == "Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" and EventID == 2008 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog="Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" EventID=2008 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_LogManagement_workspaces_LogAnalytics1_name_LogManagement_WindowsFireawallPolicySettingsChangedByMachines 'Microsoft.OperationalInsights/workspaces/savedSearches@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogManagement(${workspaces_LogAnalytics1_name})_LogManagement|WindowsFireawallPolicySettingsChangedByMachines'
  properties: {
    category: 'Log Management'
    displayName: 'On which machines and how many times have Windows Firewall Policy settings changed'
    version: 2
    query: 'Event | where EventLog == "Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" and EventID == 2008 | summarize AggregatedValue = count() by Computer | limit 500000\r\n// Oql: Type=Event EventLog="Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" EventID=2008 | measure count() by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_LogAnalytics1_name_AACAudit 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AACAudit'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AACAudit'
      displayName: 'AACAudit'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AACHttpRequest 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AACHttpRequest'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AACHttpRequest'
      displayName: 'AACHttpRequest'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADB2CRequestLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADB2CRequestLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADB2CRequestLogs'
      displayName: 'AADB2CRequestLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADCustomSecurityAttributeAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADCustomSecurityAttributeAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADCustomSecurityAttributeAuditLogs'
      displayName: 'AADCustomSecurityAttributeAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADDomainServicesAccountLogon 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADDomainServicesAccountLogon'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesAccountLogon'
      displayName: 'AADDomainServicesAccountLogon'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADDomainServicesAccountManagement 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADDomainServicesAccountManagement'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesAccountManagement'
      displayName: 'AADDomainServicesAccountManagement'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADDomainServicesDirectoryServiceAccess 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADDomainServicesDirectoryServiceAccess'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesDirectoryServiceAccess'
      displayName: 'AADDomainServicesDirectoryServiceAccess'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADDomainServicesDNSAuditsDynamicUpdates 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADDomainServicesDNSAuditsDynamicUpdates'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesDNSAuditsDynamicUpdates'
      displayName: 'AADDomainServicesDNSAuditsDynamicUpdates'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADDomainServicesDNSAuditsGeneral 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADDomainServicesDNSAuditsGeneral'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesDNSAuditsGeneral'
      displayName: 'AADDomainServicesDNSAuditsGeneral'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADDomainServicesLogonLogoff 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADDomainServicesLogonLogoff'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesLogonLogoff'
      displayName: 'AADDomainServicesLogonLogoff'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADDomainServicesPolicyChange 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADDomainServicesPolicyChange'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesPolicyChange'
      displayName: 'AADDomainServicesPolicyChange'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADDomainServicesPrivilegeUse 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADDomainServicesPrivilegeUse'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesPrivilegeUse'
      displayName: 'AADDomainServicesPrivilegeUse'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADDomainServicesSystemSecurity 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADDomainServicesSystemSecurity'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesSystemSecurity'
      displayName: 'AADDomainServicesSystemSecurity'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADFirstPartyToFirstPartySignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADFirstPartyToFirstPartySignInLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADFirstPartyToFirstPartySignInLogs'
      displayName: 'AADFirstPartyToFirstPartySignInLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADGraphActivityLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADGraphActivityLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADGraphActivityLogs'
      displayName: 'AADGraphActivityLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADManagedIdentitySignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADManagedIdentitySignInLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADManagedIdentitySignInLogs'
      displayName: 'AADManagedIdentitySignInLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADNonInteractiveUserSignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADNonInteractiveUserSignInLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADNonInteractiveUserSignInLogs'
      displayName: 'AADNonInteractiveUserSignInLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADProvisioningLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADProvisioningLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADProvisioningLogs'
      displayName: 'AADProvisioningLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADRiskyServicePrincipals 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADRiskyServicePrincipals'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADRiskyServicePrincipals'
      displayName: 'AADRiskyServicePrincipals'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADRiskyUsers 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADRiskyUsers'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADRiskyUsers'
      displayName: 'AADRiskyUsers'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADServicePrincipalRiskEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADServicePrincipalRiskEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADServicePrincipalRiskEvents'
      displayName: 'AADServicePrincipalRiskEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADServicePrincipalSignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADServicePrincipalSignInLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADServicePrincipalSignInLogs'
      displayName: 'AADServicePrincipalSignInLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AADUserRiskEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AADUserRiskEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AADUserRiskEvents'
      displayName: 'AADUserRiskEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ABSBotRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ABSBotRequests'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ABSBotRequests'
      displayName: 'ABSBotRequests'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACICollaborationAudit 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACICollaborationAudit'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACICollaborationAudit'
      displayName: 'ACICollaborationAudit'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACLTransactionLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACLTransactionLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACLTransactionLogs'
      displayName: 'ACLTransactionLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACLUserDefinedLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACLUserDefinedLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACLUserDefinedLogs'
      displayName: 'ACLUserDefinedLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACRConnectedClientList 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACRConnectedClientList'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACRConnectedClientList'
      displayName: 'ACRConnectedClientList'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACREntraAuthenticationAuditLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACREntraAuthenticationAuditLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACREntraAuthenticationAuditLog'
      displayName: 'ACREntraAuthenticationAuditLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSAdvancedMessagingOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSAdvancedMessagingOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSAdvancedMessagingOperations'
      displayName: 'ACSAdvancedMessagingOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSAuthIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSAuthIncomingOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSAuthIncomingOperations'
      displayName: 'ACSAuthIncomingOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSBillingUsage 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSBillingUsage'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSBillingUsage'
      displayName: 'ACSBillingUsage'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSCallAutomationIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSCallAutomationIncomingOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSCallAutomationIncomingOperations'
      displayName: 'ACSCallAutomationIncomingOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSCallAutomationMediaSummary 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSCallAutomationMediaSummary'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSCallAutomationMediaSummary'
      displayName: 'ACSCallAutomationMediaSummary'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSCallAutomationStreamingUsage 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSCallAutomationStreamingUsage'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSCallAutomationStreamingUsage'
      displayName: 'ACSCallAutomationStreamingUsage'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSCallClientMediaStatsTimeSeries 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSCallClientMediaStatsTimeSeries'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSCallClientMediaStatsTimeSeries'
      displayName: 'ACSCallClientMediaStatsTimeSeries'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSCallClientOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSCallClientOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSCallClientOperations'
      displayName: 'ACSCallClientOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSCallClientServiceRequestAndOutcome 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSCallClientServiceRequestAndOutcome'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSCallClientServiceRequestAndOutcome'
      displayName: 'ACSCallClientServiceRequestAndOutcome'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSCallClosedCaptionsSummary 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSCallClosedCaptionsSummary'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSCallClosedCaptionsSummary'
      displayName: 'ACSCallClosedCaptionsSummary'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSCallDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSCallDiagnostics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSCallDiagnostics'
      displayName: 'ACSCallDiagnostics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSCallDiagnosticsUpdates 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSCallDiagnosticsUpdates'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSCallDiagnosticsUpdates'
      displayName: 'ACSCallDiagnosticsUpdates'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSCallingMetrics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSCallingMetrics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSCallingMetrics'
      displayName: 'ACSCallingMetrics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSCallRecordingIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSCallRecordingIncomingOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSCallRecordingIncomingOperations'
      displayName: 'ACSCallRecordingIncomingOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSCallRecordingSummary 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSCallRecordingSummary'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSCallRecordingSummary'
      displayName: 'ACSCallRecordingSummary'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSCallSummary 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSCallSummary'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSCallSummary'
      displayName: 'ACSCallSummary'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSCallSummaryUpdates 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSCallSummaryUpdates'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSCallSummaryUpdates'
      displayName: 'ACSCallSummaryUpdates'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSCallSurvey 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSCallSurvey'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSCallSurvey'
      displayName: 'ACSCallSurvey'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSChatIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSChatIncomingOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSChatIncomingOperations'
      displayName: 'ACSChatIncomingOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSEmailSendMailOperational 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSEmailSendMailOperational'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSEmailSendMailOperational'
      displayName: 'ACSEmailSendMailOperational'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSEmailStatusUpdateOperational 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSEmailStatusUpdateOperational'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSEmailStatusUpdateOperational'
      displayName: 'ACSEmailStatusUpdateOperational'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSEmailUserEngagementOperational 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSEmailUserEngagementOperational'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSEmailUserEngagementOperational'
      displayName: 'ACSEmailUserEngagementOperational'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSJobRouterIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSJobRouterIncomingOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSJobRouterIncomingOperations'
      displayName: 'ACSJobRouterIncomingOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSOptOutManagementOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSOptOutManagementOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSOptOutManagementOperations'
      displayName: 'ACSOptOutManagementOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSRoomsIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSRoomsIncomingOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSRoomsIncomingOperations'
      displayName: 'ACSRoomsIncomingOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ACSSMSIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ACSSMSIncomingOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ACSSMSIncomingOperations'
      displayName: 'ACSSMSIncomingOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADAssessmentRecommendation'
      displayName: 'ADAssessmentRecommendation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AddonAzureBackupAlerts 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AddonAzureBackupAlerts'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupAlerts'
      displayName: 'AddonAzureBackupAlerts'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AddonAzureBackupJobs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AddonAzureBackupJobs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupJobs'
      displayName: 'AddonAzureBackupJobs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AddonAzureBackupPolicy 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AddonAzureBackupPolicy'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupPolicy'
      displayName: 'AddonAzureBackupPolicy'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AddonAzureBackupProtectedInstance 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AddonAzureBackupProtectedInstance'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupProtectedInstance'
      displayName: 'AddonAzureBackupProtectedInstance'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AddonAzureBackupStorage 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AddonAzureBackupStorage'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupStorage'
      displayName: 'AddonAzureBackupStorage'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFActivityRun 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFActivityRun'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFActivityRun'
      displayName: 'ADFActivityRun'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFAirflowSchedulerLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFAirflowSchedulerLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowSchedulerLogs'
      displayName: 'ADFAirflowSchedulerLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFAirflowTaskLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFAirflowTaskLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowTaskLogs'
      displayName: 'ADFAirflowTaskLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFAirflowWebLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFAirflowWebLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowWebLogs'
      displayName: 'ADFAirflowWebLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFAirflowWorkerLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFAirflowWorkerLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowWorkerLogs'
      displayName: 'ADFAirflowWorkerLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFPipelineRun 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFPipelineRun'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFPipelineRun'
      displayName: 'ADFPipelineRun'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFSandboxActivityRun 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFSandboxActivityRun'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFSandboxActivityRun'
      displayName: 'ADFSandboxActivityRun'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFSandboxPipelineRun 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFSandboxPipelineRun'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFSandboxPipelineRun'
      displayName: 'ADFSandboxPipelineRun'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFSSignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFSSignInLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFSSignInLogs'
      displayName: 'ADFSSignInLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFSSISIntegrationRuntimeLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFSSISIntegrationRuntimeLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISIntegrationRuntimeLogs'
      displayName: 'ADFSSISIntegrationRuntimeLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFSSISPackageEventMessageContext 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFSSISPackageEventMessageContext'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageEventMessageContext'
      displayName: 'ADFSSISPackageEventMessageContext'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFSSISPackageEventMessages 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFSSISPackageEventMessages'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageEventMessages'
      displayName: 'ADFSSISPackageEventMessages'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFSSISPackageExecutableStatistics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFSSISPackageExecutableStatistics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageExecutableStatistics'
      displayName: 'ADFSSISPackageExecutableStatistics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFSSISPackageExecutionComponentPhases 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFSSISPackageExecutionComponentPhases'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageExecutionComponentPhases'
      displayName: 'ADFSSISPackageExecutionComponentPhases'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFSSISPackageExecutionDataStatistics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFSSISPackageExecutionDataStatistics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageExecutionDataStatistics'
      displayName: 'ADFSSISPackageExecutionDataStatistics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADFTriggerRun 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADFTriggerRun'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADFTriggerRun'
      displayName: 'ADFTriggerRun'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADReplicationResult 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADReplicationResult'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADReplicationResult'
      displayName: 'ADReplicationResult'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADSecurityAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADSecurityAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADSecurityAssessmentRecommendation'
      displayName: 'ADSecurityAssessmentRecommendation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADTDataHistoryOperation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADTDataHistoryOperation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADTDataHistoryOperation'
      displayName: 'ADTDataHistoryOperation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADTDigitalTwinsOperation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADTDigitalTwinsOperation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADTDigitalTwinsOperation'
      displayName: 'ADTDigitalTwinsOperation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADTEventRoutesOperation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADTEventRoutesOperation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADTEventRoutesOperation'
      displayName: 'ADTEventRoutesOperation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADTModelsOperation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADTModelsOperation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADTModelsOperation'
      displayName: 'ADTModelsOperation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADTQueryOperation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADTQueryOperation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADTQueryOperation'
      displayName: 'ADTQueryOperation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADXCommand 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADXCommand'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADXCommand'
      displayName: 'ADXCommand'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADXDataOperation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADXDataOperation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADXDataOperation'
      displayName: 'ADXDataOperation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADXIngestionBatching 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADXIngestionBatching'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADXIngestionBatching'
      displayName: 'ADXIngestionBatching'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADXJournal 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADXJournal'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADXJournal'
      displayName: 'ADXJournal'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADXQuery 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADXQuery'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADXQuery'
      displayName: 'ADXQuery'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADXTableDetails 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADXTableDetails'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADXTableDetails'
      displayName: 'ADXTableDetails'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ADXTableUsageStatistics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ADXTableUsageStatistics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ADXTableUsageStatistics'
      displayName: 'ADXTableUsageStatistics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AegDataPlaneRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AegDataPlaneRequests'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AegDataPlaneRequests'
      displayName: 'AegDataPlaneRequests'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AegDeliveryFailureLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AegDeliveryFailureLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AegDeliveryFailureLogs'
      displayName: 'AegDeliveryFailureLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AegPublishFailureLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AegPublishFailureLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AegPublishFailureLogs'
      displayName: 'AegPublishFailureLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AEWAssignmentBlobLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AEWAssignmentBlobLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AEWAssignmentBlobLogs'
      displayName: 'AEWAssignmentBlobLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AEWAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AEWAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AEWAuditLogs'
      displayName: 'AEWAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AEWComputePipelinesLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AEWComputePipelinesLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AEWComputePipelinesLogs'
      displayName: 'AEWComputePipelinesLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AEWExperimentAssignmentSummary 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AEWExperimentAssignmentSummary'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AEWExperimentAssignmentSummary'
      displayName: 'AEWExperimentAssignmentSummary'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AEWExperimentScorecardMetricPairs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AEWExperimentScorecardMetricPairs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AEWExperimentScorecardMetricPairs'
      displayName: 'AEWExperimentScorecardMetricPairs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AEWExperimentScorecards 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AEWExperimentScorecards'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AEWExperimentScorecards'
      displayName: 'AEWExperimentScorecards'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AFSAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AFSAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AFSAuditLogs'
      displayName: 'AFSAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AGCAccessLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AGCAccessLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AGCAccessLogs'
      displayName: 'AGCAccessLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AGCFirewallLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AGCFirewallLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AGCFirewallLogs'
      displayName: 'AGCFirewallLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AgriFoodApplicationAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AgriFoodApplicationAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodApplicationAuditLogs'
      displayName: 'AgriFoodApplicationAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AgriFoodFarmManagementLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AgriFoodFarmManagementLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodFarmManagementLogs'
      displayName: 'AgriFoodFarmManagementLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AgriFoodFarmOperationLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AgriFoodFarmOperationLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodFarmOperationLogs'
      displayName: 'AgriFoodFarmOperationLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AgriFoodInsightLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AgriFoodInsightLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodInsightLogs'
      displayName: 'AgriFoodInsightLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AgriFoodJobProcessedLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AgriFoodJobProcessedLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodJobProcessedLogs'
      displayName: 'AgriFoodJobProcessedLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AgriFoodModelInferenceLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AgriFoodModelInferenceLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodModelInferenceLogs'
      displayName: 'AgriFoodModelInferenceLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AgriFoodProviderAuthLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AgriFoodProviderAuthLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodProviderAuthLogs'
      displayName: 'AgriFoodProviderAuthLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AgriFoodSatelliteLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AgriFoodSatelliteLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodSatelliteLogs'
      displayName: 'AgriFoodSatelliteLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AgriFoodSensorManagementLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AgriFoodSensorManagementLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodSensorManagementLogs'
      displayName: 'AgriFoodSensorManagementLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AgriFoodWeatherLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AgriFoodWeatherLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodWeatherLogs'
      displayName: 'AgriFoodWeatherLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AGSGrafanaLoginEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AGSGrafanaLoginEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AGSGrafanaLoginEvents'
      displayName: 'AGSGrafanaLoginEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AGSGrafanaUsageInsightsEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AGSGrafanaUsageInsightsEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AGSGrafanaUsageInsightsEvents'
      displayName: 'AGSGrafanaUsageInsightsEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AGSUpdateEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AGSUpdateEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AGSUpdateEvents'
      displayName: 'AGSUpdateEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AGWAccessLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AGWAccessLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AGWAccessLogs'
      displayName: 'AGWAccessLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AGWFirewallLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AGWFirewallLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AGWFirewallLogs'
      displayName: 'AGWFirewallLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AGWPerformanceLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AGWPerformanceLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AGWPerformanceLogs'
      displayName: 'AGWPerformanceLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AHCIDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AHCIDiagnosticLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AHCIDiagnosticLogs'
      displayName: 'AHCIDiagnosticLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AHDSDeidAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AHDSDeidAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AHDSDeidAuditLogs'
      displayName: 'AHDSDeidAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AHDSDicomAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AHDSDicomAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AHDSDicomAuditLogs'
      displayName: 'AHDSDicomAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AHDSDicomDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AHDSDicomDiagnosticLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AHDSDicomDiagnosticLogs'
      displayName: 'AHDSDicomDiagnosticLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AHDSMedTechDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AHDSMedTechDiagnosticLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AHDSMedTechDiagnosticLogs'
      displayName: 'AHDSMedTechDiagnosticLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AirflowDagProcessingLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AirflowDagProcessingLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AirflowDagProcessingLogs'
      displayName: 'AirflowDagProcessingLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AKSAudit 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AKSAudit'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AKSAudit'
      displayName: 'AKSAudit'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AKSAuditAdmin 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AKSAuditAdmin'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AKSAuditAdmin'
      displayName: 'AKSAuditAdmin'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AKSControlPlane 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AKSControlPlane'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AKSControlPlane'
      displayName: 'AKSControlPlane'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ALBHealthEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ALBHealthEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ALBHealthEvent'
      displayName: 'ALBHealthEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_Alert 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'Alert'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'Alert'
      displayName: 'Alert'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlComputeClusterEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlComputeClusterEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeClusterEvent'
      displayName: 'AmlComputeClusterEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlComputeClusterNodeEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlComputeClusterNodeEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeClusterNodeEvent'
      displayName: 'AmlComputeClusterNodeEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlComputeCpuGpuUtilization 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlComputeCpuGpuUtilization'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeCpuGpuUtilization'
      displayName: 'AmlComputeCpuGpuUtilization'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlComputeInstanceEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlComputeInstanceEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeInstanceEvent'
      displayName: 'AmlComputeInstanceEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlComputeJobEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlComputeJobEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeJobEvent'
      displayName: 'AmlComputeJobEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlDataLabelEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlDataLabelEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlDataLabelEvent'
      displayName: 'AmlDataLabelEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlDataSetEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlDataSetEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlDataSetEvent'
      displayName: 'AmlDataSetEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlDataStoreEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlDataStoreEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlDataStoreEvent'
      displayName: 'AmlDataStoreEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlDeploymentEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlDeploymentEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlDeploymentEvent'
      displayName: 'AmlDeploymentEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlEnvironmentEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlEnvironmentEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlEnvironmentEvent'
      displayName: 'AmlEnvironmentEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlInferencingEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlInferencingEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlInferencingEvent'
      displayName: 'AmlInferencingEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlModelsEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlModelsEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlModelsEvent'
      displayName: 'AmlModelsEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlOnlineEndpointConsoleLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlOnlineEndpointConsoleLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlOnlineEndpointConsoleLog'
      displayName: 'AmlOnlineEndpointConsoleLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlOnlineEndpointEventLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlOnlineEndpointEventLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlOnlineEndpointEventLog'
      displayName: 'AmlOnlineEndpointEventLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlOnlineEndpointTrafficLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlOnlineEndpointTrafficLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlOnlineEndpointTrafficLog'
      displayName: 'AmlOnlineEndpointTrafficLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlPipelineEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlPipelineEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlPipelineEvent'
      displayName: 'AmlPipelineEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlRegistryReadEventsLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlRegistryReadEventsLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlRegistryReadEventsLog'
      displayName: 'AmlRegistryReadEventsLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlRegistryWriteEventsLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlRegistryWriteEventsLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlRegistryWriteEventsLog'
      displayName: 'AmlRegistryWriteEventsLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlRunEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlRunEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlRunEvent'
      displayName: 'AmlRunEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AmlRunStatusChangedEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AmlRunStatusChangedEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AmlRunStatusChangedEvent'
      displayName: 'AmlRunStatusChangedEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AMSKeyDeliveryRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AMSKeyDeliveryRequests'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AMSKeyDeliveryRequests'
      displayName: 'AMSKeyDeliveryRequests'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AMSLiveEventOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AMSLiveEventOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AMSLiveEventOperations'
      displayName: 'AMSLiveEventOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AMSMediaAccountHealth 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AMSMediaAccountHealth'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AMSMediaAccountHealth'
      displayName: 'AMSMediaAccountHealth'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AMSStreamingEndpointRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AMSStreamingEndpointRequests'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AMSStreamingEndpointRequests'
      displayName: 'AMSStreamingEndpointRequests'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AMWMetricsUsageDetails 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AMWMetricsUsageDetails'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AMWMetricsUsageDetails'
      displayName: 'AMWMetricsUsageDetails'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ANFFileAccess 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ANFFileAccess'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ANFFileAccess'
      displayName: 'ANFFileAccess'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AOIDatabaseQuery 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AOIDatabaseQuery'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AOIDatabaseQuery'
      displayName: 'AOIDatabaseQuery'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AOIDigestion 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AOIDigestion'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AOIDigestion'
      displayName: 'AOIDigestion'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AOIStorage 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AOIStorage'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AOIStorage'
      displayName: 'AOIStorage'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ApiManagementGatewayLlmLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ApiManagementGatewayLlmLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ApiManagementGatewayLlmLog'
      displayName: 'ApiManagementGatewayLlmLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ApiManagementGatewayLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ApiManagementGatewayLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ApiManagementGatewayLogs'
      displayName: 'ApiManagementGatewayLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ApiManagementGatewayMCPLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ApiManagementGatewayMCPLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ApiManagementGatewayMCPLog'
      displayName: 'ApiManagementGatewayMCPLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ApiManagementWebSocketConnectionLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ApiManagementWebSocketConnectionLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ApiManagementWebSocketConnectionLogs'
      displayName: 'ApiManagementWebSocketConnectionLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_APIMDevPortalAuditDiagnosticLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'APIMDevPortalAuditDiagnosticLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'APIMDevPortalAuditDiagnosticLog'
      displayName: 'APIMDevPortalAuditDiagnosticLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppAvailabilityResults 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppAvailabilityResults'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppAvailabilityResults'
      displayName: 'AppAvailabilityResults'
    }
    retentionInDays: 90
  }
}

resource workspaces_LogAnalytics1_name_AppBrowserTimings 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppBrowserTimings'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppBrowserTimings'
      displayName: 'AppBrowserTimings'
    }
    retentionInDays: 90
  }
}

resource workspaces_LogAnalytics1_name_AppCenterError 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppCenterError'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppCenterError'
      displayName: 'AppCenterError'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppDependencies 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppDependencies'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppDependencies'
      displayName: 'AppDependencies'
    }
    retentionInDays: 90
  }
}

resource workspaces_LogAnalytics1_name_AppEnvSessionConsoleLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppEnvSessionConsoleLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppEnvSessionConsoleLogs'
      displayName: 'AppEnvSessionConsoleLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppEnvSessionLifecycleLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppEnvSessionLifecycleLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppEnvSessionLifecycleLogs'
      displayName: 'AppEnvSessionLifecycleLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppEnvSessionPoolEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppEnvSessionPoolEventLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppEnvSessionPoolEventLogs'
      displayName: 'AppEnvSessionPoolEventLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppEnvSpringAppConsoleLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppEnvSpringAppConsoleLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppEnvSpringAppConsoleLogs'
      displayName: 'AppEnvSpringAppConsoleLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppEvents'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppEvents'
      displayName: 'AppEvents'
    }
    retentionInDays: 90
  }
}

resource workspaces_LogAnalytics1_name_AppExceptions 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppExceptions'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppExceptions'
      displayName: 'AppExceptions'
    }
    retentionInDays: 90
  }
}

resource workspaces_LogAnalytics1_name_AppMetrics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppMetrics'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppMetrics'
      displayName: 'AppMetrics'
    }
    retentionInDays: 90
  }
}

resource workspaces_LogAnalytics1_name_AppPageViews 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppPageViews'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppPageViews'
      displayName: 'AppPageViews'
    }
    retentionInDays: 90
  }
}

resource workspaces_LogAnalytics1_name_AppPerformanceCounters 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppPerformanceCounters'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppPerformanceCounters'
      displayName: 'AppPerformanceCounters'
    }
    retentionInDays: 90
  }
}

resource workspaces_LogAnalytics1_name_AppPlatformBuildLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppPlatformBuildLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformBuildLogs'
      displayName: 'AppPlatformBuildLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppPlatformContainerEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppPlatformContainerEventLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformContainerEventLogs'
      displayName: 'AppPlatformContainerEventLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppPlatformIngressLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppPlatformIngressLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformIngressLogs'
      displayName: 'AppPlatformIngressLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppPlatformLogsforSpring 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppPlatformLogsforSpring'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformLogsforSpring'
      displayName: 'AppPlatformLogsforSpring'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppPlatformSystemLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppPlatformSystemLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformSystemLogs'
      displayName: 'AppPlatformSystemLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppRequests'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppRequests'
      displayName: 'AppRequests'
    }
    retentionInDays: 90
  }
}

resource workspaces_LogAnalytics1_name_AppServiceAntivirusScanAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppServiceAntivirusScanAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppServiceAntivirusScanAuditLogs'
      displayName: 'AppServiceAntivirusScanAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppServiceAppLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppServiceAppLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppServiceAppLogs'
      displayName: 'AppServiceAppLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppServiceAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppServiceAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppServiceAuditLogs'
      displayName: 'AppServiceAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppServiceAuthenticationLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppServiceAuthenticationLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppServiceAuthenticationLogs'
      displayName: 'AppServiceAuthenticationLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppServiceConsoleLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppServiceConsoleLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppServiceConsoleLogs'
      displayName: 'AppServiceConsoleLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppServiceEnvironmentPlatformLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppServiceEnvironmentPlatformLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppServiceEnvironmentPlatformLogs'
      displayName: 'AppServiceEnvironmentPlatformLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppServiceFileAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppServiceFileAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppServiceFileAuditLogs'
      displayName: 'AppServiceFileAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppServiceHTTPLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppServiceHTTPLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppServiceHTTPLogs'
      displayName: 'AppServiceHTTPLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppServiceIPSecAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppServiceIPSecAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppServiceIPSecAuditLogs'
      displayName: 'AppServiceIPSecAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppServicePlatformLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppServicePlatformLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppServicePlatformLogs'
      displayName: 'AppServicePlatformLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppServiceServerlessSecurityPluginData 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppServiceServerlessSecurityPluginData'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AppServiceServerlessSecurityPluginData'
      displayName: 'AppServiceServerlessSecurityPluginData'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AppSystemEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppSystemEvents'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppSystemEvents'
      displayName: 'AppSystemEvents'
    }
    retentionInDays: 90
  }
}

resource workspaces_LogAnalytics1_name_AppTraces 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AppTraces'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppTraces'
      displayName: 'AppTraces'
    }
    retentionInDays: 90
  }
}

resource workspaces_LogAnalytics1_name_ArcK8sAudit 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ArcK8sAudit'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ArcK8sAudit'
      displayName: 'ArcK8sAudit'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ArcK8sAuditAdmin 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ArcK8sAuditAdmin'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ArcK8sAuditAdmin'
      displayName: 'ArcK8sAuditAdmin'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ArcK8sControlPlane 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ArcK8sControlPlane'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ArcK8sControlPlane'
      displayName: 'ArcK8sControlPlane'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ASCAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ASCAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ASCAuditLogs'
      displayName: 'ASCAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ASCDeviceEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ASCDeviceEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ASCDeviceEvents'
      displayName: 'ASCDeviceEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ASRJobs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ASRJobs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ASRJobs'
      displayName: 'ASRJobs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ASRReplicatedItems 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ASRReplicatedItems'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ASRReplicatedItems'
      displayName: 'ASRReplicatedItems'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ASRv2HealthEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ASRv2HealthEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ASRv2HealthEvents'
      displayName: 'ASRv2HealthEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ASRv2JobEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ASRv2JobEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ASRv2JobEvents'
      displayName: 'ASRv2JobEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ASRv2ProtectedItems 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ASRv2ProtectedItems'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ASRv2ProtectedItems'
      displayName: 'ASRv2ProtectedItems'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ASRv2ReplicationExtensions 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ASRv2ReplicationExtensions'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ASRv2ReplicationExtensions'
      displayName: 'ASRv2ReplicationExtensions'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ASRv2ReplicationPolicies 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ASRv2ReplicationPolicies'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ASRv2ReplicationPolicies'
      displayName: 'ASRv2ReplicationPolicies'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ASRv2ReplicationVaults 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ASRv2ReplicationVaults'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ASRv2ReplicationVaults'
      displayName: 'ASRv2ReplicationVaults'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ATCExpressRouteCircuitIpfix 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ATCExpressRouteCircuitIpfix'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ATCExpressRouteCircuitIpfix'
      displayName: 'ATCExpressRouteCircuitIpfix'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ATCMicrosoftPeeringMetadata 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ATCMicrosoftPeeringMetadata'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ATCMicrosoftPeeringMetadata'
      displayName: 'ATCMicrosoftPeeringMetadata'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ATCPrivatePeeringMetadata 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ATCPrivatePeeringMetadata'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ATCPrivatePeeringMetadata'
      displayName: 'ATCPrivatePeeringMetadata'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AuditLogs'
      displayName: 'AuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AutoscaleEvaluationsLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AutoscaleEvaluationsLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AutoscaleEvaluationsLog'
      displayName: 'AutoscaleEvaluationsLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AutoscaleScaleActionsLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AutoscaleScaleActionsLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AutoscaleScaleActionsLog'
      displayName: 'AutoscaleScaleActionsLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AVNMConnectivityConfigurationChange 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AVNMConnectivityConfigurationChange'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AVNMConnectivityConfigurationChange'
      displayName: 'AVNMConnectivityConfigurationChange'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AVNMIPAMPoolAllocationChange 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AVNMIPAMPoolAllocationChange'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AVNMIPAMPoolAllocationChange'
      displayName: 'AVNMIPAMPoolAllocationChange'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AVNMNetworkGroupMembershipChange 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AVNMNetworkGroupMembershipChange'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AVNMNetworkGroupMembershipChange'
      displayName: 'AVNMNetworkGroupMembershipChange'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AVNMRuleCollectionChange 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AVNMRuleCollectionChange'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AVNMRuleCollectionChange'
      displayName: 'AVNMRuleCollectionChange'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AVSEsxiFirewallSyslog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AVSEsxiFirewallSyslog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AVSEsxiFirewallSyslog'
      displayName: 'AVSEsxiFirewallSyslog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AVSEsxiSyslog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AVSEsxiSyslog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AVSEsxiSyslog'
      displayName: 'AVSEsxiSyslog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AVSNsxEdgeSyslog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AVSNsxEdgeSyslog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AVSNsxEdgeSyslog'
      displayName: 'AVSNsxEdgeSyslog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AVSNsxManagerSyslog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AVSNsxManagerSyslog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AVSNsxManagerSyslog'
      displayName: 'AVSNsxManagerSyslog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AVSSyslog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AVSSyslog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AVSSyslog'
      displayName: 'AVSSyslog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AVSVcSyslog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AVSVcSyslog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AVSVcSyslog'
      displayName: 'AVSVcSyslog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZFWApplicationRule 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZFWApplicationRule'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZFWApplicationRule'
      displayName: 'AZFWApplicationRule'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZFWApplicationRuleAggregation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZFWApplicationRuleAggregation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZFWApplicationRuleAggregation'
      displayName: 'AZFWApplicationRuleAggregation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZFWDnsFlowTrace 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZFWDnsFlowTrace'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZFWDnsFlowTrace'
      displayName: 'AZFWDnsFlowTrace'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZFWDnsQuery 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZFWDnsQuery'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZFWDnsQuery'
      displayName: 'AZFWDnsQuery'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZFWFatFlow 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZFWFatFlow'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZFWFatFlow'
      displayName: 'AZFWFatFlow'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZFWFlowTrace 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZFWFlowTrace'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZFWFlowTrace'
      displayName: 'AZFWFlowTrace'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZFWIdpsSignature 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZFWIdpsSignature'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZFWIdpsSignature'
      displayName: 'AZFWIdpsSignature'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZFWInternalFqdnResolutionFailure 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZFWInternalFqdnResolutionFailure'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZFWInternalFqdnResolutionFailure'
      displayName: 'AZFWInternalFqdnResolutionFailure'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZFWNatRule 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZFWNatRule'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZFWNatRule'
      displayName: 'AZFWNatRule'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZFWNatRuleAggregation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZFWNatRuleAggregation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZFWNatRuleAggregation'
      displayName: 'AZFWNatRuleAggregation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZFWNetworkRule 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZFWNetworkRule'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZFWNetworkRule'
      displayName: 'AZFWNetworkRule'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZFWNetworkRuleAggregation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZFWNetworkRuleAggregation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZFWNetworkRuleAggregation'
      displayName: 'AZFWNetworkRuleAggregation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZFWThreatIntel 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZFWThreatIntel'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZFWThreatIntel'
      displayName: 'AZFWThreatIntel'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZKVAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZKVAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZKVAuditLogs'
      displayName: 'AZKVAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZKVPolicyEvaluationDetailsLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZKVPolicyEvaluationDetailsLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZKVPolicyEvaluationDetailsLogs'
      displayName: 'AZKVPolicyEvaluationDetailsLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZMSApplicationMetricLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZMSApplicationMetricLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZMSApplicationMetricLogs'
      displayName: 'AZMSApplicationMetricLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZMSArchiveLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZMSArchiveLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZMSArchiveLogs'
      displayName: 'AZMSArchiveLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZMSAutoscaleLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZMSAutoscaleLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZMSAutoscaleLogs'
      displayName: 'AZMSAutoscaleLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZMSCustomerManagedKeyUserLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZMSCustomerManagedKeyUserLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZMSCustomerManagedKeyUserLogs'
      displayName: 'AZMSCustomerManagedKeyUserLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZMSDiagnosticErrorLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZMSDiagnosticErrorLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZMSDiagnosticErrorLogs'
      displayName: 'AZMSDiagnosticErrorLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZMSHybridConnectionsEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZMSHybridConnectionsEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZMSHybridConnectionsEvents'
      displayName: 'AZMSHybridConnectionsEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZMSKafkaCoordinatorLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZMSKafkaCoordinatorLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZMSKafkaCoordinatorLogs'
      displayName: 'AZMSKafkaCoordinatorLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZMSKafkaUserErrorLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZMSKafkaUserErrorLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZMSKafkaUserErrorLogs'
      displayName: 'AZMSKafkaUserErrorLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZMSOperationalLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZMSOperationalLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZMSOperationalLogs'
      displayName: 'AZMSOperationalLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZMSRunTimeAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZMSRunTimeAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZMSRunTimeAuditLogs'
      displayName: 'AZMSRunTimeAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AZMSVnetConnectionEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AZMSVnetConnectionEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AZMSVnetConnectionEvents'
      displayName: 'AZMSVnetConnectionEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AzureActivity 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AzureActivity'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AzureActivity'
      displayName: 'AzureActivity'
    }
    retentionInDays: 90
  }
}

resource workspaces_LogAnalytics1_name_AzureActivityV2 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AzureActivityV2'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AzureActivityV2'
      displayName: 'AzureActivityV2'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AzureAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AzureAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AzureAssessmentRecommendation'
      displayName: 'AzureAssessmentRecommendation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AzureAttestationDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AzureAttestationDiagnostics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AzureAttestationDiagnostics'
      displayName: 'AzureAttestationDiagnostics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AzureBackupOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AzureBackupOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AzureBackupOperations'
      displayName: 'AzureBackupOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AzureDevOpsAuditing 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AzureDevOpsAuditing'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AzureDevOpsAuditing'
      displayName: 'AzureDevOpsAuditing'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AzureLoadTestingOperation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AzureLoadTestingOperation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AzureLoadTestingOperation'
      displayName: 'AzureLoadTestingOperation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AzureMetrics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AzureMetrics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AzureMetrics'
      displayName: 'AzureMetrics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_AzureMetricsV2 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'AzureMetricsV2'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'AzureMetricsV2'
      displayName: 'AzureMetricsV2'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_BehaviorEntities 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'BehaviorEntities'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'BehaviorEntities'
      displayName: 'BehaviorEntities'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_BehaviorInfo 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'BehaviorInfo'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'BehaviorInfo'
      displayName: 'BehaviorInfo'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_BlockchainApplicationLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'BlockchainApplicationLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'BlockchainApplicationLog'
      displayName: 'BlockchainApplicationLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_BlockchainProxyLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'BlockchainProxyLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'BlockchainProxyLog'
      displayName: 'BlockchainProxyLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CassandraAudit 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CassandraAudit'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CassandraAudit'
      displayName: 'CassandraAudit'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CassandraLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CassandraLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CassandraLogs'
      displayName: 'CassandraLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CCFApplicationLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CCFApplicationLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CCFApplicationLogs'
      displayName: 'CCFApplicationLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CDBCassandraRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CDBCassandraRequests'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CDBCassandraRequests'
      displayName: 'CDBCassandraRequests'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CDBControlPlaneRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CDBControlPlaneRequests'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CDBControlPlaneRequests'
      displayName: 'CDBControlPlaneRequests'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CDBDataPlaneRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CDBDataPlaneRequests'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CDBDataPlaneRequests'
      displayName: 'CDBDataPlaneRequests'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CDBDataPlaneRequests15M 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CDBDataPlaneRequests15M'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CDBDataPlaneRequests15M'
      displayName: 'CDBDataPlaneRequests15M'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CDBDataPlaneRequests5M 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CDBDataPlaneRequests5M'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CDBDataPlaneRequests5M'
      displayName: 'CDBDataPlaneRequests5M'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CDBGremlinRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CDBGremlinRequests'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CDBGremlinRequests'
      displayName: 'CDBGremlinRequests'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CDBMongoRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CDBMongoRequests'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CDBMongoRequests'
      displayName: 'CDBMongoRequests'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CDBPartitionKeyRUConsumption 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CDBPartitionKeyRUConsumption'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CDBPartitionKeyRUConsumption'
      displayName: 'CDBPartitionKeyRUConsumption'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CDBPartitionKeyStatistics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CDBPartitionKeyStatistics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CDBPartitionKeyStatistics'
      displayName: 'CDBPartitionKeyStatistics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CDBQueryRuntimeStatistics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CDBQueryRuntimeStatistics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CDBQueryRuntimeStatistics'
      displayName: 'CDBQueryRuntimeStatistics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CDBTableApiRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CDBTableApiRequests'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CDBTableApiRequests'
      displayName: 'CDBTableApiRequests'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ChaosStudioExperimentEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ChaosStudioExperimentEventLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ChaosStudioExperimentEventLogs'
      displayName: 'ChaosStudioExperimentEventLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CHSMServiceOperationAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CHSMServiceOperationAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CHSMServiceOperationAuditLogs'
      displayName: 'CHSMServiceOperationAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CIEventsAudit 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CIEventsAudit'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CIEventsAudit'
      displayName: 'CIEventsAudit'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CIEventsOperational 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CIEventsOperational'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CIEventsOperational'
      displayName: 'CIEventsOperational'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CloudHsmServiceOperationAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CloudHsmServiceOperationAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CloudHsmServiceOperationAuditLogs'
      displayName: 'CloudHsmServiceOperationAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ComputerGroup 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ComputerGroup'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ComputerGroup'
      displayName: 'ComputerGroup'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ContainerAppConsoleLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ContainerAppConsoleLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ContainerAppConsoleLogs'
      displayName: 'ContainerAppConsoleLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ContainerAppSystemLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ContainerAppSystemLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ContainerAppSystemLogs'
      displayName: 'ContainerAppSystemLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ContainerEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ContainerEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ContainerEvent'
      displayName: 'ContainerEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ContainerImageInventory 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ContainerImageInventory'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ContainerImageInventory'
      displayName: 'ContainerImageInventory'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ContainerInstanceLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ContainerInstanceLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ContainerInstanceLog'
      displayName: 'ContainerInstanceLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ContainerInventory 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ContainerInventory'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ContainerInventory'
      displayName: 'ContainerInventory'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ContainerLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ContainerLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ContainerLog'
      displayName: 'ContainerLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ContainerLogV2 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ContainerLogV2'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ContainerLogV2'
      displayName: 'ContainerLogV2'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ContainerNetworkLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ContainerNetworkLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ContainerNetworkLogs'
      displayName: 'ContainerNetworkLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ContainerNodeInventory 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ContainerNodeInventory'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ContainerNodeInventory'
      displayName: 'ContainerNodeInventory'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ContainerRegistryLoginEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ContainerRegistryLoginEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ContainerRegistryLoginEvents'
      displayName: 'ContainerRegistryLoginEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ContainerRegistryRepositoryEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ContainerRegistryRepositoryEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ContainerRegistryRepositoryEvents'
      displayName: 'ContainerRegistryRepositoryEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ContainerServiceLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ContainerServiceLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ContainerServiceLog'
      displayName: 'ContainerServiceLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_CoreAzureBackup 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'CoreAzureBackup'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'CoreAzureBackup'
      displayName: 'CoreAzureBackup'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksAccounts 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksAccounts'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksAccounts'
      displayName: 'DatabricksAccounts'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksApps 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksApps'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksApps'
      displayName: 'DatabricksApps'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksBrickStoreHttpGateway 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksBrickStoreHttpGateway'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksBrickStoreHttpGateway'
      displayName: 'DatabricksBrickStoreHttpGateway'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksBudgetPolicyCentral 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksBudgetPolicyCentral'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksBudgetPolicyCentral'
      displayName: 'DatabricksBudgetPolicyCentral'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksCapsule8Dataplane 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksCapsule8Dataplane'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksCapsule8Dataplane'
      displayName: 'DatabricksCapsule8Dataplane'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksClamAVScan 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksClamAVScan'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksClamAVScan'
      displayName: 'DatabricksClamAVScan'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksCloudStorageMetadata 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksCloudStorageMetadata'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksCloudStorageMetadata'
      displayName: 'DatabricksCloudStorageMetadata'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksClusterLibraries 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksClusterLibraries'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksClusterLibraries'
      displayName: 'DatabricksClusterLibraries'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksClusterPolicies 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksClusterPolicies'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksClusterPolicies'
      displayName: 'DatabricksClusterPolicies'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksClusters 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksClusters'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksClusters'
      displayName: 'DatabricksClusters'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksDashboards 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksDashboards'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDashboards'
      displayName: 'DatabricksDashboards'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksDatabricksSQL 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksDatabricksSQL'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDatabricksSQL'
      displayName: 'DatabricksDatabricksSQL'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksDataMonitoring 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksDataMonitoring'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDataMonitoring'
      displayName: 'DatabricksDataMonitoring'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksDataRooms 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksDataRooms'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDataRooms'
      displayName: 'DatabricksDataRooms'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksDBFS 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksDBFS'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDBFS'
      displayName: 'DatabricksDBFS'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksDeltaPipelines 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksDeltaPipelines'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDeltaPipelines'
      displayName: 'DatabricksDeltaPipelines'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksFeatureStore 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksFeatureStore'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksFeatureStore'
      displayName: 'DatabricksFeatureStore'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksFiles 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksFiles'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksFiles'
      displayName: 'DatabricksFiles'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksFilesystem 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksFilesystem'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksFilesystem'
      displayName: 'DatabricksFilesystem'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksGenie 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksGenie'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksGenie'
      displayName: 'DatabricksGenie'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksGitCredentials 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksGitCredentials'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksGitCredentials'
      displayName: 'DatabricksGitCredentials'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksGlobalInitScripts 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksGlobalInitScripts'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksGlobalInitScripts'
      displayName: 'DatabricksGlobalInitScripts'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksGroups 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksGroups'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksGroups'
      displayName: 'DatabricksGroups'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksIAMRole 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksIAMRole'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksIAMRole'
      displayName: 'DatabricksIAMRole'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksIngestion 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksIngestion'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksIngestion'
      displayName: 'DatabricksIngestion'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksInstancePools 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksInstancePools'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksInstancePools'
      displayName: 'DatabricksInstancePools'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksJobs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksJobs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksJobs'
      displayName: 'DatabricksJobs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksLakeviewConfig 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksLakeviewConfig'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksLakeviewConfig'
      displayName: 'DatabricksLakeviewConfig'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksLineageTracking 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksLineageTracking'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksLineageTracking'
      displayName: 'DatabricksLineageTracking'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksMarketplaceConsumer 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksMarketplaceConsumer'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksMarketplaceConsumer'
      displayName: 'DatabricksMarketplaceConsumer'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksMarketplaceProvider 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksMarketplaceProvider'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksMarketplaceProvider'
      displayName: 'DatabricksMarketplaceProvider'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksMLflowAcledArtifact 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksMLflowAcledArtifact'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksMLflowAcledArtifact'
      displayName: 'DatabricksMLflowAcledArtifact'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksMLflowExperiment 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksMLflowExperiment'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksMLflowExperiment'
      displayName: 'DatabricksMLflowExperiment'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksModelRegistry 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksModelRegistry'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksModelRegistry'
      displayName: 'DatabricksModelRegistry'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksNotebook 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksNotebook'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksNotebook'
      displayName: 'DatabricksNotebook'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksOnlineTables 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksOnlineTables'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksOnlineTables'
      displayName: 'DatabricksOnlineTables'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksPartnerHub 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksPartnerHub'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksPartnerHub'
      displayName: 'DatabricksPartnerHub'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksPredictiveOptimization 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksPredictiveOptimization'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksPredictiveOptimization'
      displayName: 'DatabricksPredictiveOptimization'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksRBAC 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksRBAC'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksRBAC'
      displayName: 'DatabricksRBAC'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksRemoteHistoryService 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksRemoteHistoryService'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksRemoteHistoryService'
      displayName: 'DatabricksRemoteHistoryService'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksRepos 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksRepos'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksRepos'
      displayName: 'DatabricksRepos'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksRFA 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksRFA'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksRFA'
      displayName: 'DatabricksRFA'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksSecrets 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksSecrets'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSecrets'
      displayName: 'DatabricksSecrets'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksServerlessRealTimeInference 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksServerlessRealTimeInference'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksServerlessRealTimeInference'
      displayName: 'DatabricksServerlessRealTimeInference'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksSQL 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksSQL'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSQL'
      displayName: 'DatabricksSQL'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksSQLPermissions 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksSQLPermissions'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSQLPermissions'
      displayName: 'DatabricksSQLPermissions'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksSSH 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksSSH'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSSH'
      displayName: 'DatabricksSSH'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksTables 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksTables'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksTables'
      displayName: 'DatabricksTables'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksUnityCatalog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksUnityCatalog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksUnityCatalog'
      displayName: 'DatabricksUnityCatalog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksVectorSearch 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksVectorSearch'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksVectorSearch'
      displayName: 'DatabricksVectorSearch'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksWebhookNotifications 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksWebhookNotifications'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksWebhookNotifications'
      displayName: 'DatabricksWebhookNotifications'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksWebTerminal 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksWebTerminal'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksWebTerminal'
      displayName: 'DatabricksWebTerminal'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksWorkspace 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksWorkspace'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksWorkspace'
      displayName: 'DatabricksWorkspace'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DatabricksWorkspaceFiles 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DatabricksWorkspaceFiles'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DatabricksWorkspaceFiles'
      displayName: 'DatabricksWorkspaceFiles'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DataSetOutput 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DataSetOutput'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DataSetOutput'
      displayName: 'DataSetOutput'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DataSetRuns 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DataSetRuns'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DataSetRuns'
      displayName: 'DataSetRuns'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DataTransferOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DataTransferOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DataTransferOperations'
      displayName: 'DataTransferOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DCRLogErrors 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DCRLogErrors'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DCRLogErrors'
      displayName: 'DCRLogErrors'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DCRLogTroubleshooting 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DCRLogTroubleshooting'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DCRLogTroubleshooting'
      displayName: 'DCRLogTroubleshooting'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DevCenterAgentHealthLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DevCenterAgentHealthLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DevCenterAgentHealthLogs'
      displayName: 'DevCenterAgentHealthLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DevCenterBillingEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DevCenterBillingEventLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DevCenterBillingEventLogs'
      displayName: 'DevCenterBillingEventLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DevCenterConnectionLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DevCenterConnectionLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DevCenterConnectionLogs'
      displayName: 'DevCenterConnectionLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DevCenterDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DevCenterDiagnosticLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DevCenterDiagnosticLogs'
      displayName: 'DevCenterDiagnosticLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DevCenterResourceOperationLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DevCenterResourceOperationLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DevCenterResourceOperationLogs'
      displayName: 'DevCenterResourceOperationLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DeviceBehaviorEntities 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DeviceBehaviorEntities'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DeviceBehaviorEntities'
      displayName: 'DeviceBehaviorEntities'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DeviceBehaviorInfo 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DeviceBehaviorInfo'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DeviceBehaviorInfo'
      displayName: 'DeviceBehaviorInfo'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DeviceCustomFileEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DeviceCustomFileEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DeviceCustomFileEvents'
      displayName: 'DeviceCustomFileEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DeviceCustomImageLoadEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DeviceCustomImageLoadEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DeviceCustomImageLoadEvents'
      displayName: 'DeviceCustomImageLoadEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DeviceCustomNetworkEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DeviceCustomNetworkEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DeviceCustomNetworkEvents'
      displayName: 'DeviceCustomNetworkEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DeviceCustomProcessEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DeviceCustomProcessEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DeviceCustomProcessEvents'
      displayName: 'DeviceCustomProcessEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DeviceCustomScriptEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DeviceCustomScriptEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DeviceCustomScriptEvents'
      displayName: 'DeviceCustomScriptEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DNSQueryLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DNSQueryLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DNSQueryLogs'
      displayName: 'DNSQueryLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DSMAzureBlobStorageLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DSMAzureBlobStorageLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DSMAzureBlobStorageLogs'
      displayName: 'DSMAzureBlobStorageLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DSMDataClassificationLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DSMDataClassificationLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DSMDataClassificationLogs'
      displayName: 'DSMDataClassificationLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DSMDataLabelingLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DSMDataLabelingLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DSMDataLabelingLogs'
      displayName: 'DSMDataLabelingLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_DurableTaskSchedulerLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'DurableTaskSchedulerLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'DurableTaskSchedulerLogs'
      displayName: 'DurableTaskSchedulerLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_EdgeActionConsoleLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'EdgeActionConsoleLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'EdgeActionConsoleLog'
      displayName: 'EdgeActionConsoleLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_EGNFailedHttpDataPlaneOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'EGNFailedHttpDataPlaneOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'EGNFailedHttpDataPlaneOperations'
      displayName: 'EGNFailedHttpDataPlaneOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_EGNFailedMqttConnections 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'EGNFailedMqttConnections'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'EGNFailedMqttConnections'
      displayName: 'EGNFailedMqttConnections'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_EGNFailedMqttPublishedMessages 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'EGNFailedMqttPublishedMessages'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'EGNFailedMqttPublishedMessages'
      displayName: 'EGNFailedMqttPublishedMessages'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_EGNFailedMqttSubscriptions 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'EGNFailedMqttSubscriptions'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'EGNFailedMqttSubscriptions'
      displayName: 'EGNFailedMqttSubscriptions'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_EGNMqttDisconnections 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'EGNMqttDisconnections'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'EGNMqttDisconnections'
      displayName: 'EGNMqttDisconnections'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_EGNSuccessfulHttpDataPlaneOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'EGNSuccessfulHttpDataPlaneOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'EGNSuccessfulHttpDataPlaneOperations'
      displayName: 'EGNSuccessfulHttpDataPlaneOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_EGNSuccessfulMqttConnections 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'EGNSuccessfulMqttConnections'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'EGNSuccessfulMqttConnections'
      displayName: 'EGNSuccessfulMqttConnections'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_EnrichedMicrosoft365AuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'EnrichedMicrosoft365AuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'EnrichedMicrosoft365AuditLogs'
      displayName: 'EnrichedMicrosoft365AuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ETWEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ETWEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ETWEvent'
      displayName: 'ETWEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_Event 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'Event'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'Event'
      displayName: 'Event'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ExchangeAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ExchangeAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ExchangeAssessmentRecommendation'
      displayName: 'ExchangeAssessmentRecommendation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ExchangeOnlineAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ExchangeOnlineAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ExchangeOnlineAssessmentRecommendation'
      displayName: 'ExchangeOnlineAssessmentRecommendation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_FailedIngestion 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'FailedIngestion'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'FailedIngestion'
      displayName: 'FailedIngestion'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_FunctionAppLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'FunctionAppLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'FunctionAppLogs'
      displayName: 'FunctionAppLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightAmbariClusterAlerts 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightAmbariClusterAlerts'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightAmbariClusterAlerts'
      displayName: 'HDInsightAmbariClusterAlerts'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightAmbariSystemMetrics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightAmbariSystemMetrics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightAmbariSystemMetrics'
      displayName: 'HDInsightAmbariSystemMetrics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightGatewayAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightGatewayAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightGatewayAuditLogs'
      displayName: 'HDInsightGatewayAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightHadoopAndYarnLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightHadoopAndYarnLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHadoopAndYarnLogs'
      displayName: 'HDInsightHadoopAndYarnLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightHadoopAndYarnMetrics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightHadoopAndYarnMetrics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHadoopAndYarnMetrics'
      displayName: 'HDInsightHadoopAndYarnMetrics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightHBaseLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightHBaseLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHBaseLogs'
      displayName: 'HDInsightHBaseLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightHBaseMetrics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightHBaseMetrics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHBaseMetrics'
      displayName: 'HDInsightHBaseMetrics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightHiveAndLLAPLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightHiveAndLLAPLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveAndLLAPLogs'
      displayName: 'HDInsightHiveAndLLAPLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightHiveAndLLAPMetrics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightHiveAndLLAPMetrics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveAndLLAPMetrics'
      displayName: 'HDInsightHiveAndLLAPMetrics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightHiveQueryAppStats 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightHiveQueryAppStats'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveQueryAppStats'
      displayName: 'HDInsightHiveQueryAppStats'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightHiveTezAppStats 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightHiveTezAppStats'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveTezAppStats'
      displayName: 'HDInsightHiveTezAppStats'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightJupyterNotebookEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightJupyterNotebookEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightJupyterNotebookEvents'
      displayName: 'HDInsightJupyterNotebookEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightKafkaLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightKafkaLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightKafkaLogs'
      displayName: 'HDInsightKafkaLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightKafkaMetrics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightKafkaMetrics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightKafkaMetrics'
      displayName: 'HDInsightKafkaMetrics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightKafkaServerLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightKafkaServerLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightKafkaServerLog'
      displayName: 'HDInsightKafkaServerLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightOozieLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightOozieLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightOozieLogs'
      displayName: 'HDInsightOozieLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightRangerAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightRangerAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightRangerAuditLogs'
      displayName: 'HDInsightRangerAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightSecurityLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightSecurityLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSecurityLogs'
      displayName: 'HDInsightSecurityLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightSparkApplicationEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightSparkApplicationEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkApplicationEvents'
      displayName: 'HDInsightSparkApplicationEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightSparkBlockManagerEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightSparkBlockManagerEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkBlockManagerEvents'
      displayName: 'HDInsightSparkBlockManagerEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightSparkEnvironmentEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightSparkEnvironmentEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkEnvironmentEvents'
      displayName: 'HDInsightSparkEnvironmentEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightSparkExecutorEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightSparkExecutorEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkExecutorEvents'
      displayName: 'HDInsightSparkExecutorEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightSparkExtraEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightSparkExtraEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkExtraEvents'
      displayName: 'HDInsightSparkExtraEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightSparkJobEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightSparkJobEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkJobEvents'
      displayName: 'HDInsightSparkJobEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightSparkLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightSparkLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkLogs'
      displayName: 'HDInsightSparkLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightSparkSQLExecutionEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightSparkSQLExecutionEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkSQLExecutionEvents'
      displayName: 'HDInsightSparkSQLExecutionEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightSparkStageEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightSparkStageEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkStageEvents'
      displayName: 'HDInsightSparkStageEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightSparkStageTaskAccumulables 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightSparkStageTaskAccumulables'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkStageTaskAccumulables'
      displayName: 'HDInsightSparkStageTaskAccumulables'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightSparkTaskEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightSparkTaskEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkTaskEvents'
      displayName: 'HDInsightSparkTaskEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightStormLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightStormLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightStormLogs'
      displayName: 'HDInsightStormLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightStormMetrics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightStormMetrics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightStormMetrics'
      displayName: 'HDInsightStormMetrics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HDInsightStormTopologyMetrics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HDInsightStormTopologyMetrics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HDInsightStormTopologyMetrics'
      displayName: 'HDInsightStormTopologyMetrics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_HealthStateChangeEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'HealthStateChangeEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'HealthStateChangeEvent'
      displayName: 'HealthStateChangeEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_Heartbeat 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'Heartbeat'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'Heartbeat'
      displayName: 'Heartbeat'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_InsightsMetrics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'InsightsMetrics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'InsightsMetrics'
      displayName: 'InsightsMetrics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_IntuneAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'IntuneAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'IntuneAuditLogs'
      displayName: 'IntuneAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_IntuneDeviceComplianceOrg 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'IntuneDeviceComplianceOrg'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'IntuneDeviceComplianceOrg'
      displayName: 'IntuneDeviceComplianceOrg'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_IntuneDevices 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'IntuneDevices'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'IntuneDevices'
      displayName: 'IntuneDevices'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_IntuneOperationalLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'IntuneOperationalLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'IntuneOperationalLogs'
      displayName: 'IntuneOperationalLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_KubeEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'KubeEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'KubeEvents'
      displayName: 'KubeEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_KubeHealth 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'KubeHealth'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'KubeHealth'
      displayName: 'KubeHealth'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_KubeMonAgentEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'KubeMonAgentEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'KubeMonAgentEvents'
      displayName: 'KubeMonAgentEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_KubeNodeInventory 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'KubeNodeInventory'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'KubeNodeInventory'
      displayName: 'KubeNodeInventory'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_KubePodInventory 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'KubePodInventory'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'KubePodInventory'
      displayName: 'KubePodInventory'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_KubePVInventory 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'KubePVInventory'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'KubePVInventory'
      displayName: 'KubePVInventory'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_KubeServices 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'KubeServices'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'KubeServices'
      displayName: 'KubeServices'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_LAJobLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LAJobLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'LAJobLogs'
      displayName: 'LAJobLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_LAQueryLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LAQueryLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'LAQueryLogs'
      displayName: 'LAQueryLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_LASummaryLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LASummaryLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'LASummaryLogs'
      displayName: 'LASummaryLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_LIATrackingEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LIATrackingEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'LIATrackingEvents'
      displayName: 'LIATrackingEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_LogicAppWorkflowRuntime 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'LogicAppWorkflowRuntime'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'LogicAppWorkflowRuntime'
      displayName: 'LogicAppWorkflowRuntime'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MCCEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MCCEventLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MCCEventLogs'
      displayName: 'MCCEventLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MCVPAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MCVPAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MCVPAuditLogs'
      displayName: 'MCVPAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MCVPOperationLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MCVPOperationLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MCVPOperationLogs'
      displayName: 'MCVPOperationLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MDCDetectionDNSEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MDCDetectionDNSEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MDCDetectionDNSEvents'
      displayName: 'MDCDetectionDNSEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MDCDetectionFimEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MDCDetectionFimEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MDCDetectionFimEvents'
      displayName: 'MDCDetectionFimEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MDCDetectionGatingValidationEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MDCDetectionGatingValidationEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MDCDetectionGatingValidationEvents'
      displayName: 'MDCDetectionGatingValidationEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MDCDetectionK8SApiEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MDCDetectionK8SApiEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MDCDetectionK8SApiEvents'
      displayName: 'MDCDetectionK8SApiEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MDCDetectionProcessV2Events 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MDCDetectionProcessV2Events'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MDCDetectionProcessV2Events'
      displayName: 'MDCDetectionProcessV2Events'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MDCFileIntegrityMonitoringEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MDCFileIntegrityMonitoringEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MDCFileIntegrityMonitoringEvents'
      displayName: 'MDCFileIntegrityMonitoringEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MDECustomCollectionDeviceFileEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MDECustomCollectionDeviceFileEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MDECustomCollectionDeviceFileEvents'
      displayName: 'MDECustomCollectionDeviceFileEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MDPResourceLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MDPResourceLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MDPResourceLog'
      displayName: 'MDPResourceLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MeshControlPlane 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MeshControlPlane'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MeshControlPlane'
      displayName: 'MeshControlPlane'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MicrosoftAzureBastionAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MicrosoftAzureBastionAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftAzureBastionAuditLogs'
      displayName: 'MicrosoftAzureBastionAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MicrosoftDataShareReceivedSnapshotLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MicrosoftDataShareReceivedSnapshotLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftDataShareReceivedSnapshotLog'
      displayName: 'MicrosoftDataShareReceivedSnapshotLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MicrosoftDataShareSentSnapshotLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MicrosoftDataShareSentSnapshotLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftDataShareSentSnapshotLog'
      displayName: 'MicrosoftDataShareSentSnapshotLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MicrosoftDataShareShareLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MicrosoftDataShareShareLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftDataShareShareLog'
      displayName: 'MicrosoftDataShareShareLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MicrosoftGraphActivityLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MicrosoftGraphActivityLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftGraphActivityLogs'
      displayName: 'MicrosoftGraphActivityLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MicrosoftHealthcareApisAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MicrosoftHealthcareApisAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftHealthcareApisAuditLogs'
      displayName: 'MicrosoftHealthcareApisAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MicrosoftServicePrincipalSignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MicrosoftServicePrincipalSignInLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftServicePrincipalSignInLogs'
      displayName: 'MicrosoftServicePrincipalSignInLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MNFDeviceUpdates 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MNFDeviceUpdates'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MNFDeviceUpdates'
      displayName: 'MNFDeviceUpdates'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MNFSystemSessionHistoryUpdates 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MNFSystemSessionHistoryUpdates'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MNFSystemSessionHistoryUpdates'
      displayName: 'MNFSystemSessionHistoryUpdates'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MNFSystemStateMessageUpdates 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MNFSystemStateMessageUpdates'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MNFSystemStateMessageUpdates'
      displayName: 'MNFSystemStateMessageUpdates'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MPCIngestionLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MPCIngestionLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MPCIngestionLogs'
      displayName: 'MPCIngestionLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MySqlAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MySqlAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MySqlAuditLogs'
      displayName: 'MySqlAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_MySqlSlowLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'MySqlSlowLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'MySqlSlowLogs'
      displayName: 'MySqlSlowLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NatGatewayFlowlogsV1 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NatGatewayFlowlogsV1'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NatGatewayFlowlogsV1'
      displayName: 'NatGatewayFlowlogsV1'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NCBMBreakGlassAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NCBMBreakGlassAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NCBMBreakGlassAuditLogs'
      displayName: 'NCBMBreakGlassAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NCBMSecurityDefenderLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NCBMSecurityDefenderLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NCBMSecurityDefenderLogs'
      displayName: 'NCBMSecurityDefenderLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NCBMSecurityLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NCBMSecurityLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NCBMSecurityLogs'
      displayName: 'NCBMSecurityLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NCBMSystemLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NCBMSystemLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NCBMSystemLogs'
      displayName: 'NCBMSystemLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NCCIDRACLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NCCIDRACLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NCCIDRACLogs'
      displayName: 'NCCIDRACLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NCCKubernetesLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NCCKubernetesLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NCCKubernetesLogs'
      displayName: 'NCCKubernetesLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NCCPlatformOperationsLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NCCPlatformOperationsLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NCCPlatformOperationsLogs'
      displayName: 'NCCPlatformOperationsLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NCCVMOrchestrationLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NCCVMOrchestrationLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NCCVMOrchestrationLogs'
      displayName: 'NCCVMOrchestrationLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NCMClusterOperationsLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NCMClusterOperationsLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NCMClusterOperationsLogs'
      displayName: 'NCMClusterOperationsLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NCSStorageAlerts 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NCSStorageAlerts'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NCSStorageAlerts'
      displayName: 'NCSStorageAlerts'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NCSStorageAudits 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NCSStorageAudits'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NCSStorageAudits'
      displayName: 'NCSStorageAudits'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NCSStorageLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NCSStorageLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NCSStorageLogs'
      displayName: 'NCSStorageLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NetworkAccessAlerts 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NetworkAccessAlerts'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NetworkAccessAlerts'
      displayName: 'NetworkAccessAlerts'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NetworkAccessConnectionEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NetworkAccessConnectionEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NetworkAccessConnectionEvents'
      displayName: 'NetworkAccessConnectionEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NetworkAccessGenerativeAIInsights 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NetworkAccessGenerativeAIInsights'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NetworkAccessGenerativeAIInsights'
      displayName: 'NetworkAccessGenerativeAIInsights'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NetworkAccessTraffic 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NetworkAccessTraffic'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NetworkAccessTraffic'
      displayName: 'NetworkAccessTraffic'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NginxUpstreamUpdateLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NginxUpstreamUpdateLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NginxUpstreamUpdateLogs'
      displayName: 'NginxUpstreamUpdateLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NGXOperationLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NGXOperationLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NGXOperationLogs'
      displayName: 'NGXOperationLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NGXSecurityLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NGXSecurityLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NGXSecurityLogs'
      displayName: 'NGXSecurityLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NSPAccessLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NSPAccessLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NSPAccessLogs'
      displayName: 'NSPAccessLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NTAInsights 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NTAInsights'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NTAInsights'
      displayName: 'NTAInsights'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NTAIpDetails 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NTAIpDetails'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NTAIpDetails'
      displayName: 'NTAIpDetails'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NTANetAnalytics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NTANetAnalytics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NTANetAnalytics'
      displayName: 'NTANetAnalytics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NTARuleRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NTARuleRecommendation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NTARuleRecommendation'
      displayName: 'NTARuleRecommendation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NTATopologyDetails 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NTATopologyDetails'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NTATopologyDetails'
      displayName: 'NTATopologyDetails'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NWConnectionMonitorDestinationListenerResult 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NWConnectionMonitorDestinationListenerResult'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NWConnectionMonitorDestinationListenerResult'
      displayName: 'NWConnectionMonitorDestinationListenerResult'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NWConnectionMonitorDNSResult 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NWConnectionMonitorDNSResult'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NWConnectionMonitorDNSResult'
      displayName: 'NWConnectionMonitorDNSResult'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NWConnectionMonitorPathResult 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NWConnectionMonitorPathResult'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NWConnectionMonitorPathResult'
      displayName: 'NWConnectionMonitorPathResult'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_NWConnectionMonitorTestResult 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'NWConnectionMonitorTestResult'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'NWConnectionMonitorTestResult'
      displayName: 'NWConnectionMonitorTestResult'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OEPAirFlowTask 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OEPAirFlowTask'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OEPAirFlowTask'
      displayName: 'OEPAirFlowTask'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OEPAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OEPAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OEPAuditLogs'
      displayName: 'OEPAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OEPDataplaneLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OEPDataplaneLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OEPDataplaneLogs'
      displayName: 'OEPDataplaneLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OEPElasticOperator 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OEPElasticOperator'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OEPElasticOperator'
      displayName: 'OEPElasticOperator'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OEPElasticsearch 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OEPElasticsearch'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OEPElasticsearch'
      displayName: 'OEPElasticsearch'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OEWAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OEWAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OEWAuditLogs'
      displayName: 'OEWAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OEWExperimentAssignmentSummary 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OEWExperimentAssignmentSummary'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OEWExperimentAssignmentSummary'
      displayName: 'OEWExperimentAssignmentSummary'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OEWExperimentScorecardMetricPairs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OEWExperimentScorecardMetricPairs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OEWExperimentScorecardMetricPairs'
      displayName: 'OEWExperimentScorecardMetricPairs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OEWExperimentScorecards 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OEWExperimentScorecards'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OEWExperimentScorecards'
      displayName: 'OEWExperimentScorecards'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OGOAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OGOAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OGOAuditLogs'
      displayName: 'OGOAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OLPSupplyChainEntityOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OLPSupplyChainEntityOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OLPSupplyChainEntityOperations'
      displayName: 'OLPSupplyChainEntityOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OLPSupplyChainEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OLPSupplyChainEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OLPSupplyChainEvents'
      displayName: 'OLPSupplyChainEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OmsCustomerProfileFact 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OmsCustomerProfileFact'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OmsCustomerProfileFact'
      displayName: 'OmsCustomerProfileFact'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_Operation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'Operation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'Operation'
      displayName: 'Operation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OracleCloudDatabase 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OracleCloudDatabase'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OracleCloudDatabase'
      displayName: 'OracleCloudDatabase'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OTelEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OTelEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OTelEvents'
      displayName: 'OTelEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OTelLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OTelLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OTelLogs'
      displayName: 'OTelLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OTelResources 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OTelResources'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OTelResources'
      displayName: 'OTelResources'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OTelSpans 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OTelSpans'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OTelSpans'
      displayName: 'OTelSpans'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OTelTraces 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OTelTraces'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OTelTraces'
      displayName: 'OTelTraces'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_OTelTracesAgent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'OTelTracesAgent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'OTelTracesAgent'
      displayName: 'OTelTracesAgent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_Perf 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'Perf'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'Perf'
      displayName: 'Perf'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PerfInsightsFindings 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PerfInsightsFindings'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PerfInsightsFindings'
      displayName: 'PerfInsightsFindings'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PerfInsightsImpactedResources 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PerfInsightsImpactedResources'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PerfInsightsImpactedResources'
      displayName: 'PerfInsightsImpactedResources'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PerfInsightsRun 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PerfInsightsRun'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PerfInsightsRun'
      displayName: 'PerfInsightsRun'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PFTitleAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PFTitleAuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PFTitleAuditLogs'
      displayName: 'PFTitleAuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PGSQLAutovacuumStats 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PGSQLAutovacuumStats'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PGSQLAutovacuumStats'
      displayName: 'PGSQLAutovacuumStats'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PGSQLDbTransactionsStats 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PGSQLDbTransactionsStats'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PGSQLDbTransactionsStats'
      displayName: 'PGSQLDbTransactionsStats'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PGSQLPgBouncer 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PGSQLPgBouncer'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PGSQLPgBouncer'
      displayName: 'PGSQLPgBouncer'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PGSQLPgStatActivitySessions 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PGSQLPgStatActivitySessions'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PGSQLPgStatActivitySessions'
      displayName: 'PGSQLPgStatActivitySessions'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PGSQLQueryStoreQueryText 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PGSQLQueryStoreQueryText'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PGSQLQueryStoreQueryText'
      displayName: 'PGSQLQueryStoreQueryText'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PGSQLQueryStoreRuntime 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PGSQLQueryStoreRuntime'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PGSQLQueryStoreRuntime'
      displayName: 'PGSQLQueryStoreRuntime'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PGSQLQueryStoreWaits 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PGSQLQueryStoreWaits'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PGSQLQueryStoreWaits'
      displayName: 'PGSQLQueryStoreWaits'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PGSQLServerLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PGSQLServerLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PGSQLServerLogs'
      displayName: 'PGSQLServerLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PowerBIDatasetsTenant 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PowerBIDatasetsTenant'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PowerBIDatasetsTenant'
      displayName: 'PowerBIDatasetsTenant'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PowerBIDatasetsWorkspace 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PowerBIDatasetsWorkspace'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PowerBIDatasetsWorkspace'
      displayName: 'PowerBIDatasetsWorkspace'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PurviewDataSensitivityLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PurviewDataSensitivityLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PurviewDataSensitivityLogs'
      displayName: 'PurviewDataSensitivityLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PurviewScanStatusLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PurviewScanStatusLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PurviewScanStatusLogs'
      displayName: 'PurviewScanStatusLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_PurviewSecurityLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'PurviewSecurityLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'PurviewSecurityLogs'
      displayName: 'PurviewSecurityLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_REDConnectionEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'REDConnectionEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'REDConnectionEvents'
      displayName: 'REDConnectionEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_RemoteNetworkHealthLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'RemoteNetworkHealthLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'RemoteNetworkHealthLogs'
      displayName: 'RemoteNetworkHealthLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ResourceManagementPublicAccessLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ResourceManagementPublicAccessLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ResourceManagementPublicAccessLogs'
      displayName: 'ResourceManagementPublicAccessLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_RetinaNetworkFlowLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'RetinaNetworkFlowLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'RetinaNetworkFlowLogs'
      displayName: 'RetinaNetworkFlowLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SCCMAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SCCMAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SCCMAssessmentRecommendation'
      displayName: 'SCCMAssessmentRecommendation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SCGPoolExecutionLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SCGPoolExecutionLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SCGPoolExecutionLog'
      displayName: 'SCGPoolExecutionLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SCGPoolRequestLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SCGPoolRequestLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SCGPoolRequestLog'
      displayName: 'SCGPoolRequestLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SCOMAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SCOMAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SCOMAssessmentRecommendation'
      displayName: 'SCOMAssessmentRecommendation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ServiceFabricOperationalEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ServiceFabricOperationalEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ServiceFabricOperationalEvent'
      displayName: 'ServiceFabricOperationalEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ServiceFabricReliableActorEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ServiceFabricReliableActorEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ServiceFabricReliableActorEvent'
      displayName: 'ServiceFabricReliableActorEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ServiceFabricReliableServiceEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ServiceFabricReliableServiceEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ServiceFabricReliableServiceEvent'
      displayName: 'ServiceFabricReliableServiceEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SfBAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SfBAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SfBAssessmentRecommendation'
      displayName: 'SfBAssessmentRecommendation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SfBOnlineAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SfBOnlineAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SfBOnlineAssessmentRecommendation'
      displayName: 'SfBOnlineAssessmentRecommendation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SharePointOnlineAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SharePointOnlineAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SharePointOnlineAssessmentRecommendation'
      displayName: 'SharePointOnlineAssessmentRecommendation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SignalRServiceDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SignalRServiceDiagnosticLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SignalRServiceDiagnosticLogs'
      displayName: 'SignalRServiceDiagnosticLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SigninLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SigninLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SigninLogs'
      displayName: 'SigninLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SPAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SPAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SPAssessmentRecommendation'
      displayName: 'SPAssessmentRecommendation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SQLAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SQLAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SQLAssessmentRecommendation'
      displayName: 'SQLAssessmentRecommendation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SQLSecurityAuditEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SQLSecurityAuditEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SQLSecurityAuditEvents'
      displayName: 'SQLSecurityAuditEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_StorageAntimalwareScanResults 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'StorageAntimalwareScanResults'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'StorageAntimalwareScanResults'
      displayName: 'StorageAntimalwareScanResults'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_StorageBlobLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'StorageBlobLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'StorageBlobLogs'
      displayName: 'StorageBlobLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_StorageCacheOperationEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'StorageCacheOperationEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'StorageCacheOperationEvents'
      displayName: 'StorageCacheOperationEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_StorageCacheUpgradeEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'StorageCacheUpgradeEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'StorageCacheUpgradeEvents'
      displayName: 'StorageCacheUpgradeEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_StorageCacheWarningEvents 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'StorageCacheWarningEvents'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'StorageCacheWarningEvents'
      displayName: 'StorageCacheWarningEvents'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_StorageFileLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'StorageFileLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'StorageFileLogs'
      displayName: 'StorageFileLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_StorageMalwareScanningResults 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'StorageMalwareScanningResults'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'StorageMalwareScanningResults'
      displayName: 'StorageMalwareScanningResults'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_StorageMoverCopyLogsFailed 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'StorageMoverCopyLogsFailed'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'StorageMoverCopyLogsFailed'
      displayName: 'StorageMoverCopyLogsFailed'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_StorageMoverCopyLogsTransferred 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'StorageMoverCopyLogsTransferred'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'StorageMoverCopyLogsTransferred'
      displayName: 'StorageMoverCopyLogsTransferred'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_StorageMoverJobRunLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'StorageMoverJobRunLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'StorageMoverJobRunLogs'
      displayName: 'StorageMoverJobRunLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_StorageQueueLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'StorageQueueLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'StorageQueueLogs'
      displayName: 'StorageQueueLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_StorageTableLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'StorageTableLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'StorageTableLogs'
      displayName: 'StorageTableLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SucceededIngestion 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SucceededIngestion'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SucceededIngestion'
      displayName: 'SucceededIngestion'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SVMPoolExecutionLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SVMPoolExecutionLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SVMPoolExecutionLog'
      displayName: 'SVMPoolExecutionLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SVMPoolRequestLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SVMPoolRequestLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SVMPoolRequestLog'
      displayName: 'SVMPoolRequestLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseBigDataPoolApplicationsEnded 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseBigDataPoolApplicationsEnded'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseBigDataPoolApplicationsEnded'
      displayName: 'SynapseBigDataPoolApplicationsEnded'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseBuiltinSqlPoolRequestsEnded 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseBuiltinSqlPoolRequestsEnded'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseBuiltinSqlPoolRequestsEnded'
      displayName: 'SynapseBuiltinSqlPoolRequestsEnded'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseDXCommand 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseDXCommand'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXCommand'
      displayName: 'SynapseDXCommand'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseDXFailedIngestion 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseDXFailedIngestion'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXFailedIngestion'
      displayName: 'SynapseDXFailedIngestion'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseDXIngestionBatching 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseDXIngestionBatching'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXIngestionBatching'
      displayName: 'SynapseDXIngestionBatching'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseDXQuery 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseDXQuery'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXQuery'
      displayName: 'SynapseDXQuery'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseDXSucceededIngestion 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseDXSucceededIngestion'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXSucceededIngestion'
      displayName: 'SynapseDXSucceededIngestion'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseDXTableDetails 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseDXTableDetails'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXTableDetails'
      displayName: 'SynapseDXTableDetails'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseDXTableUsageStatistics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseDXTableUsageStatistics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXTableUsageStatistics'
      displayName: 'SynapseDXTableUsageStatistics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseGatewayApiRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseGatewayApiRequests'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseGatewayApiRequests'
      displayName: 'SynapseGatewayApiRequests'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseIntegrationActivityRuns 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseIntegrationActivityRuns'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseIntegrationActivityRuns'
      displayName: 'SynapseIntegrationActivityRuns'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseIntegrationPipelineRuns 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseIntegrationPipelineRuns'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseIntegrationPipelineRuns'
      displayName: 'SynapseIntegrationPipelineRuns'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseIntegrationTriggerRuns 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseIntegrationTriggerRuns'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseIntegrationTriggerRuns'
      displayName: 'SynapseIntegrationTriggerRuns'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseLinkEvent 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseLinkEvent'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseLinkEvent'
      displayName: 'SynapseLinkEvent'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseRbacOperations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseRbacOperations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseRbacOperations'
      displayName: 'SynapseRbacOperations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseScopePoolScopeJobsEnded 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseScopePoolScopeJobsEnded'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseScopePoolScopeJobsEnded'
      displayName: 'SynapseScopePoolScopeJobsEnded'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseScopePoolScopeJobsStateChange 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseScopePoolScopeJobsStateChange'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseScopePoolScopeJobsStateChange'
      displayName: 'SynapseScopePoolScopeJobsStateChange'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseSqlPoolDmsWorkers 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseSqlPoolDmsWorkers'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolDmsWorkers'
      displayName: 'SynapseSqlPoolDmsWorkers'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseSqlPoolExecRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseSqlPoolExecRequests'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolExecRequests'
      displayName: 'SynapseSqlPoolExecRequests'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseSqlPoolRequestSteps 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseSqlPoolRequestSteps'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolRequestSteps'
      displayName: 'SynapseSqlPoolRequestSteps'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseSqlPoolSqlRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseSqlPoolSqlRequests'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolSqlRequests'
      displayName: 'SynapseSqlPoolSqlRequests'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_SynapseSqlPoolWaits 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'SynapseSqlPoolWaits'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolWaits'
      displayName: 'SynapseSqlPoolWaits'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_Syslog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'Syslog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'Syslog'
      displayName: 'Syslog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_TOUserAudits 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'TOUserAudits'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'TOUserAudits'
      displayName: 'TOUserAudits'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_TOUserDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'TOUserDiagnostics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'TOUserDiagnostics'
      displayName: 'TOUserDiagnostics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_TSIIngress 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'TSIIngress'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'TSIIngress'
      displayName: 'TSIIngress'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_UCClient 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'UCClient'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'UCClient'
      displayName: 'UCClient'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_UCClientReadinessStatus 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'UCClientReadinessStatus'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'UCClientReadinessStatus'
      displayName: 'UCClientReadinessStatus'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_UCClientUpdateStatus 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'UCClientUpdateStatus'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'UCClientUpdateStatus'
      displayName: 'UCClientUpdateStatus'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_UCDeviceAlert 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'UCDeviceAlert'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'UCDeviceAlert'
      displayName: 'UCDeviceAlert'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_UCDOAggregatedStatus 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'UCDOAggregatedStatus'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'UCDOAggregatedStatus'
      displayName: 'UCDOAggregatedStatus'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_UCDOStatus 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'UCDOStatus'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'UCDOStatus'
      displayName: 'UCDOStatus'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_UCServiceUpdateStatus 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'UCServiceUpdateStatus'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'UCServiceUpdateStatus'
      displayName: 'UCServiceUpdateStatus'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_UCUpdateAlert 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'UCUpdateAlert'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'UCUpdateAlert'
      displayName: 'UCUpdateAlert'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_Usage 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'Usage'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'Usage'
      displayName: 'Usage'
    }
    retentionInDays: 90
  }
}

resource workspaces_LogAnalytics1_name_VCoreMongoRequests 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'VCoreMongoRequests'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'VCoreMongoRequests'
      displayName: 'VCoreMongoRequests'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_VIAudit 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'VIAudit'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'VIAudit'
      displayName: 'VIAudit'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_VIIndexing 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'VIIndexing'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'VIIndexing'
      displayName: 'VIIndexing'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_VMBoundPort 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'VMBoundPort'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'VMBoundPort'
      displayName: 'VMBoundPort'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_VMComputer 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'VMComputer'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'VMComputer'
      displayName: 'VMComputer'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_VMConnection 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'VMConnection'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'VMConnection'
      displayName: 'VMConnection'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_VMProcess 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'VMProcess'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'VMProcess'
      displayName: 'VMProcess'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_W3CIISLog 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'W3CIISLog'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'W3CIISLog'
      displayName: 'W3CIISLog'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WebPubSubConnectivity 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WebPubSubConnectivity'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WebPubSubConnectivity'
      displayName: 'WebPubSubConnectivity'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WebPubSubHttpRequest 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WebPubSubHttpRequest'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WebPubSubHttpRequest'
      displayName: 'WebPubSubHttpRequest'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WebPubSubMessaging 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WebPubSubMessaging'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WebPubSubMessaging'
      displayName: 'WebPubSubMessaging'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_Windows365AuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'Windows365AuditLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'Windows365AuditLogs'
      displayName: 'Windows365AuditLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WindowsClientAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WindowsClientAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WindowsClientAssessmentRecommendation'
      displayName: 'WindowsClientAssessmentRecommendation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WindowsServerAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WindowsServerAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WindowsServerAssessmentRecommendation'
      displayName: 'WindowsServerAssessmentRecommendation'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WorkloadDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WorkloadDiagnosticLogs'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WorkloadDiagnosticLogs'
      displayName: 'WorkloadDiagnosticLogs'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WOUserAudits 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WOUserAudits'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WOUserAudits'
      displayName: 'WOUserAudits'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WOUserDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WOUserDiagnostics'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WOUserDiagnostics'
      displayName: 'WOUserDiagnostics'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WVDAgentHealthStatus 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WVDAgentHealthStatus'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WVDAgentHealthStatus'
      displayName: 'WVDAgentHealthStatus'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WVDAutoscaleEvaluationPooled 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WVDAutoscaleEvaluationPooled'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WVDAutoscaleEvaluationPooled'
      displayName: 'WVDAutoscaleEvaluationPooled'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WVDCheckpoints 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WVDCheckpoints'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WVDCheckpoints'
      displayName: 'WVDCheckpoints'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WVDConnectionGraphicsDataPreview 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WVDConnectionGraphicsDataPreview'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WVDConnectionGraphicsDataPreview'
      displayName: 'WVDConnectionGraphicsDataPreview'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WVDConnectionNetworkData 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WVDConnectionNetworkData'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WVDConnectionNetworkData'
      displayName: 'WVDConnectionNetworkData'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WVDConnections 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WVDConnections'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WVDConnections'
      displayName: 'WVDConnections'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WVDErrors 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WVDErrors'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WVDErrors'
      displayName: 'WVDErrors'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WVDFeeds 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WVDFeeds'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WVDFeeds'
      displayName: 'WVDFeeds'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WVDHostRegistrations 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WVDHostRegistrations'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WVDHostRegistrations'
      displayName: 'WVDHostRegistrations'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WVDManagement 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WVDManagement'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WVDManagement'
      displayName: 'WVDManagement'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WVDMultiLinkAdd 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WVDMultiLinkAdd'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WVDMultiLinkAdd'
      displayName: 'WVDMultiLinkAdd'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_WVDSessionHostManagement 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'WVDSessionHostManagement'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'WVDSessionHostManagement'
      displayName: 'WVDSessionHostManagement'
    }
    retentionInDays: 60
  }
}

resource workspaces_LogAnalytics1_name_ZTSRequest 'Microsoft.OperationalInsights/workspaces/tables@2025-02-01' = {
  parent: workspaces_LogAnalytics1_name_resource
  name: 'ZTSRequest'
  properties: {
    totalRetentionInDays: 60
    plan: 'Analytics'
    schema: {
      name: 'ZTSRequest'
      displayName: 'ZTSRequest'
    }
    retentionInDays: 60
  }
}

resource servers_sqlserverq7efyqm4edbxa_name_Default 'Microsoft.Sql/servers/advancedThreatProtectionSettings@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource servers_sqlserverq7efyqm4edbxa_name_CreateIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sqlserverq7efyqm4edbxa_name_DbParameterization 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sqlserverq7efyqm4edbxa_name_DefragmentIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sqlserverq7efyqm4edbxa_name_DropIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sqlserverq7efyqm4edbxa_name_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource Microsoft_Sql_servers_auditingPolicies_servers_sqlserverq7efyqm4edbxa_name_Default 'Microsoft.Sql/servers/auditingPolicies@2014-04-01' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'Default'
  location: 'East US'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_auditingSettings_servers_sqlserverq7efyqm4edbxa_name_Default 'Microsoft.Sql/servers/auditingSettings@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource Microsoft_Sql_servers_connectionPolicies_servers_sqlserverq7efyqm4edbxa_name_default 'Microsoft.Sql/servers/connectionPolicies@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'default'
  location: 'eastus'
  properties: {
    connectionType: 'Default'
  }
}

resource servers_sqlserverq7efyqm4edbxa_name_sampledb 'Microsoft.Sql/servers/databases@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'sampledb'
  location: 'eastus'
  tags: {
    displayName: 'Database'
  }
  sku: {
    name: 'Basic'
    tier: 'Basic'
    capacity: 5
  }
  kind: 'v12.0,user'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 1073741824
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/80ea84e8-afce-4851-928a-9e2219724c69/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
    availabilityZone: 'NoPreference'
  }
}

resource servers_sqlserverq7efyqm4edbxa_name_master_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2024-05-01-preview' = {
  name: '${servers_sqlserverq7efyqm4edbxa_name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_servers_sqlserverq7efyqm4edbxa_name_master_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_sqlserverq7efyqm4edbxa_name}/master/Default'
  location: 'East US'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sqlserverq7efyqm4edbxa_name_master_Default 'Microsoft.Sql/servers/databases/auditingSettings@2024-05-01-preview' = {
  name: '${servers_sqlserverq7efyqm4edbxa_name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sqlserverq7efyqm4edbxa_name_master_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2024-05-01-preview' = {
  name: '${servers_sqlserverq7efyqm4edbxa_name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sqlserverq7efyqm4edbxa_name_master_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2024-05-01-preview' = {
  name: '${servers_sqlserverq7efyqm4edbxa_name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource servers_sqlserverq7efyqm4edbxa_name_master_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2024-05-01-preview' = {
  name: '${servers_sqlserverq7efyqm4edbxa_name}/master/Current'
  properties: {}
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sqlserverq7efyqm4edbxa_name_master_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2024-05-01-preview' = {
  name: '${servers_sqlserverq7efyqm4edbxa_name}/master/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sqlserverq7efyqm4edbxa_name_master_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2024-05-01-preview' = {
  name: '${servers_sqlserverq7efyqm4edbxa_name}/master/Current'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sqlserverq7efyqm4edbxa_name_master_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2024-05-01-preview' = {
  name: '${servers_sqlserverq7efyqm4edbxa_name}/master/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_devOpsAuditingSettings_servers_sqlserverq7efyqm4edbxa_name_Default 'Microsoft.Sql/servers/devOpsAuditingSettings@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'Default'
  properties: {
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_sqlserverq7efyqm4edbxa_name_current 'Microsoft.Sql/servers/encryptionProtector@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'current'
  kind: 'servicemanaged'
  properties: {
    serverKeyName: 'ServiceManaged'
    serverKeyType: 'ServiceManaged'
    autoRotationEnabled: false
  }
}

resource Microsoft_Sql_servers_extendedAuditingSettings_servers_sqlserverq7efyqm4edbxa_name_Default 'Microsoft.Sql/servers/extendedAuditingSettings@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_sqlserverq7efyqm4edbxa_name_AllowAllWindowsAzureIps 'Microsoft.Sql/servers/firewallRules@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'AllowAllWindowsAzureIps'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

resource servers_sqlserverq7efyqm4edbxa_name_ServiceManaged 'Microsoft.Sql/servers/keys@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'ServiceManaged'
  kind: 'servicemanaged'
  properties: {
    serverKeyType: 'ServiceManaged'
  }
}

resource Microsoft_Sql_servers_securityAlertPolicies_servers_sqlserverq7efyqm4edbxa_name_Default 'Microsoft.Sql/servers/securityAlertPolicies@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
}

resource Microsoft_Sql_servers_sqlVulnerabilityAssessments_servers_sqlserverq7efyqm4edbxa_name_Default 'Microsoft.Sql/servers/sqlVulnerabilityAssessments@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource Microsoft_Sql_servers_vulnerabilityAssessments_servers_sqlserverq7efyqm4edbxa_name_Default 'Microsoft.Sql/servers/vulnerabilityAssessments@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_resource
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
    storageContainerPath: vulnerabilityAssessments_Default_storageContainerPath
  }
}

resource sites_AzureLinuxAppZZ777_webapp_name_resource 'Microsoft.Web/sites@2024-11-01' = {
  name: sites_AzureLinuxAppZZ777_webapp_name
  location: 'East US'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/80ea84e8-afce-4851-928a-9e2219724c69/resourceGroups/1-9e75ed71-playground-sandbox/providers/microsoft.insights/components/AzureLinuxAppZZ777-webapp'
  }
  kind: 'app,linux'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: 'azurelinuxappzz777-webapp.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: 'azurelinuxappzz777-webapp.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_AppServicePlan_AzureLinuxAppZZ777_name_resource.id
    reserved: true
    isXenon: false
    hyperV: false
    dnsConfiguration: {}
    outboundVnetRouting: {
      allTraffic: false
      applicationTraffic: false
      contentShareTraffic: false
      imagePullTraffic: false
      backupRestoreTraffic: false
    }
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: 'php'
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 0
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: true
    clientAffinityProxyEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    ipMode: 'IPv4'
    customDomainVerificationId: '6B647559AEA509C1FF3BD7D8886C8B729E1BA4E88AC437B2068A9960C4604AA5'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    endToEndEncryptionEnabled: false
    redundancyMode: 'None'
    publicNetworkAccess: 'Enabled'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_websiteq7efyqm4edbxa_name_resource 'Microsoft.Web/sites@2024-11-01' = {
  name: sites_websiteq7efyqm4edbxa_name
  location: 'East US'
  tags: {
    displayName: 'Website'
    'hidden-related:/subscriptions/80ea84e8-afce-4851-928a-9e2219724c69/resourceGroups/1-9e75ed71-playground-sandbox/providers/Microsoft.Web/serverfarms/hostingplanq7efyqm4edbxa': 'empty'
  }
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_websiteq7efyqm4edbxa_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_websiteq7efyqm4edbxa_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_hostingplanq7efyqm4edbxa_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    dnsConfiguration: {}
    outboundVnetRouting: {
      allTraffic: false
      applicationTraffic: false
      contentShareTraffic: false
      imagePullTraffic: false
      backupRestoreTraffic: false
    }
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 0
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: true
    clientAffinityProxyEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    ipMode: 'IPv4'
    customDomainVerificationId: '6B647559AEA509C1FF3BD7D8886C8B729E1BA4E88AC437B2068A9960C4604AA5'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: false
    endToEndEncryptionEnabled: false
    redundancyMode: 'None'
    publicNetworkAccess: 'Enabled'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_AzureLinuxAppZZ777_webapp_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2024-11-01' = {
  parent: sites_AzureLinuxAppZZ777_webapp_name_resource
  name: 'ftp'
  location: 'East US'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/80ea84e8-afce-4851-928a-9e2219724c69/resourceGroups/1-9e75ed71-playground-sandbox/providers/microsoft.insights/components/AzureLinuxAppZZ777-webapp'
  }
  properties: {
    allow: true
  }
}

resource sites_websiteq7efyqm4edbxa_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2024-11-01' = {
  parent: sites_websiteq7efyqm4edbxa_name_resource
  name: 'ftp'
  location: 'East US'
  tags: {
    displayName: 'Website'
    'hidden-related:/subscriptions/80ea84e8-afce-4851-928a-9e2219724c69/resourceGroups/1-9e75ed71-playground-sandbox/providers/Microsoft.Web/serverfarms/hostingplanq7efyqm4edbxa': 'empty'
  }
  properties: {
    allow: true
  }
}

resource sites_AzureLinuxAppZZ777_webapp_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2024-11-01' = {
  parent: sites_AzureLinuxAppZZ777_webapp_name_resource
  name: 'scm'
  location: 'East US'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/80ea84e8-afce-4851-928a-9e2219724c69/resourceGroups/1-9e75ed71-playground-sandbox/providers/microsoft.insights/components/AzureLinuxAppZZ777-webapp'
  }
  properties: {
    allow: true
  }
}

resource sites_websiteq7efyqm4edbxa_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2024-11-01' = {
  parent: sites_websiteq7efyqm4edbxa_name_resource
  name: 'scm'
  location: 'East US'
  tags: {
    displayName: 'Website'
    'hidden-related:/subscriptions/80ea84e8-afce-4851-928a-9e2219724c69/resourceGroups/1-9e75ed71-playground-sandbox/providers/Microsoft.Web/serverfarms/hostingplanq7efyqm4edbxa': 'empty'
  }
  properties: {
    allow: true
  }
}

resource sites_AzureLinuxAppZZ777_webapp_name_web 'Microsoft.Web/sites/config@2024-11-01' = {
  parent: sites_AzureLinuxAppZZ777_webapp_name_resource
  name: 'web'
  location: 'East US'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/80ea84e8-afce-4851-928a-9e2219724c69/resourceGroups/1-9e75ed71-playground-sandbox/providers/microsoft.insights/components/AzureLinuxAppZZ777-webapp'
  }
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v4.0'
    linuxFxVersion: 'php'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$AzureLinuxAppZZ777-webapp'
    scmType: 'None'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    localMySqlEnabled: false
    managedServiceIdentityId: 15876
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    elasticWebAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 0
    azureStorageAccounts: {}
    http20ProxyFlag: 0
  }
}

resource sites_websiteq7efyqm4edbxa_name_web 'Microsoft.Web/sites/config@2024-11-01' = {
  parent: sites_websiteq7efyqm4edbxa_name_resource
  name: 'web'
  location: 'East US'
  tags: {
    displayName: 'Website'
    'hidden-related:/subscriptions/80ea84e8-afce-4851-928a-9e2219724c69/resourceGroups/1-9e75ed71-playground-sandbox/providers/Microsoft.Web/serverfarms/hostingplanq7efyqm4edbxa': 'empty'
  }
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v4.0'
    phpVersion: '5.6'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$websiteq7efyqm4edbxa'
    scmType: 'None'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    elasticWebAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 0
    azureStorageAccounts: {}
    http20ProxyFlag: 0
  }
}

resource sites_AzureLinuxAppZZ777_webapp_name_sites_AzureLinuxAppZZ777_webapp_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2024-11-01' = {
  parent: sites_AzureLinuxAppZZ777_webapp_name_resource
  name: '${sites_AzureLinuxAppZZ777_webapp_name}.azurewebsites.net'
  location: 'East US'
  properties: {
    siteName: 'AzureLinuxAppZZ777-webapp'
    hostNameType: 'Verified'
  }
}

resource sites_websiteq7efyqm4edbxa_name_sites_websiteq7efyqm4edbxa_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2024-11-01' = {
  parent: sites_websiteq7efyqm4edbxa_name_resource
  name: '${sites_websiteq7efyqm4edbxa_name}.azurewebsites.net'
  location: 'East US'
  properties: {
    siteName: 'websiteq7efyqm4edbxa'
    hostNameType: 'Verified'
  }
}

resource dataCollectionRules_WinVMDCR_name_resource 'Microsoft.Insights/dataCollectionRules@2023-03-11' = {
  name: dataCollectionRules_WinVMDCR_name
  location: 'eastus'
  kind: 'Windows'
  properties: {
    dataCollectionEndpointId: dataCollectionEndpoints_IaaSVMCollectionEndpoint_name_resource.id
    streamDeclarations: {}
    dataSources: {
      windowsEventLogs: [
        {
          streams: [
            'Microsoft-Event'
          ]
          xPathQueries: [
            'Application!*[System[(Level=1 or Level=2)]]'
            'Security!*[System[(band(Keywords,4503599627370496))]]'
            'System!*[System[(Level=1 or Level=2)]]'
          ]
          name: 'eventLogsDataSource'
        }
      ]
      iisLogs: [
        {
          streams: [
            'Microsoft-W3CIISLog'
          ]
          name: 'iisLogsDataSource'
        }
      ]
    }
    destinations: {
      logAnalytics: [
        {
          workspaceResourceId: workspaces_LogAnalytics1_name_resource.id
          name: 'la--1808026071'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Microsoft-Event'
        ]
        destinations: [
          'la--1808026071'
        ]
        transformKql: 'source'
        outputStream: 'Microsoft-Event'
      }
      {
        streams: [
          'Microsoft-W3CIISLog'
        ]
        destinations: [
          'la--1808026071'
        ]
        transformKql: 'source'
        outputStream: 'Microsoft-W3CIISLog'
      }
    ]
  }
}

resource metricAlerts_HighCPU_name_resource 'microsoft.insights/metricAlerts@2018-03-01' = {
  name: metricAlerts_HighCPU_name
  location: 'global'
  properties: {
    description: 'more than 90%'
    severity: 2
    enabled: true
    scopes: [
      virtualMachines_Linux_VM2_name_resource.id
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT15M'
    criteria: {
      allOf: [
        {
          threshold: json('90')
          name: 'Metric1'
          metricNamespace: 'Microsoft.Compute/virtualMachines'
          metricName: 'Percentage CPU'
          operator: 'GreaterThan'
          timeAggregation: 'Average'
          skipMetricValidation: false
          criterionType: 'StaticThresholdCriterion'
        }
      ]
      'odata.type': 'Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria'
    }
    autoMitigate: true
    targetResourceType: 'Microsoft.Compute/virtualMachines'
    targetResourceRegion: 'eastus'
    actions: [
      {
        actionGroupId: actionGroups_NotifyCPU_name_resource.id
        webHookProperties: {}
      }
    ]
  }
}

resource servers_sqlserverq7efyqm4edbxa_name_sampledb_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource servers_sqlserverq7efyqm4edbxa_name_sampledb_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource servers_sqlserverq7efyqm4edbxa_name_sampledb_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource servers_sqlserverq7efyqm4edbxa_name_sampledb_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource servers_sqlserverq7efyqm4edbxa_name_sampledb_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource servers_sqlserverq7efyqm4edbxa_name_sampledb_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_servers_sqlserverq7efyqm4edbxa_name_sampledb_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'Default'
  location: 'East US'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sqlserverq7efyqm4edbxa_name_sampledb_Default 'Microsoft.Sql/servers/databases/auditingSettings@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sqlserverq7efyqm4edbxa_name_sampledb_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sqlserverq7efyqm4edbxa_name_sampledb_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 24
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sqlserverq7efyqm4edbxa_name_sampledb_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sqlserverq7efyqm4edbxa_name_sampledb_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'Default'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource servers_sqlserverq7efyqm4edbxa_name_sampledb_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'Current'
  properties: {}
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sqlserverq7efyqm4edbxa_name_sampledb_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sqlserverq7efyqm4edbxa_name_sampledb_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'Current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sqlserverq7efyqm4edbxa_name_sampledb_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2024-05-01-preview' = {
  parent: servers_sqlserverq7efyqm4edbxa_name_sampledb
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_sqlserverq7efyqm4edbxa_name_resource
  ]
}

resource networkInterfaces_linux_vm2528_name_resource 'Microsoft.Network/networkInterfaces@2024-07-01' = {
  name: networkInterfaces_linux_vm2528_name
  location: 'eastus'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${networkInterfaces_linux_vm2528_name_resource.id}/ipConfigurations/ipconfig1'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          privateIPAddress: '172.17.0.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_Linux_VM2_ip_name_resource.id
            properties: {
              deleteOption: 'Detach'
            }
          }
          subnet: {
            id: virtualNetworks_vnet_eastus_1_name_snet_eastus_1.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: true
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: networkSecurityGroups_Linux_VM2_nsg_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}

resource networkInterfaces_ws_vm125_name_resource 'Microsoft.Network/networkInterfaces@2024-07-01' = {
  name: networkInterfaces_ws_vm125_name
  location: 'eastus'
  tags: {
    purpose: 'Deploy and configure Azure Monitor'
  }
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${networkInterfaces_ws_vm125_name_resource.id}/ipConfigurations/ipconfig1'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          privateIPAddress: '172.16.0.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_WS_VM1_ip_name_resource.id
            properties: {
              deleteOption: 'Detach'
            }
          }
          subnet: {
            id: virtualNetworks_vnet_eastus_name_snet_eastus_1.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: true
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: networkSecurityGroups_WS_VM1_nsg_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}
