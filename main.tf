# Onboarding Module Example

# Add the Tenant connection with an App Registration / Enterprise App (Security Principal)
module "polaris-azure-cloud-native_tenant" {
  source                          = "../terraform-azure-polaris-cloud-native_tenant"
  
  azure_tenant_id                 = var.azure_tenant_id
  polaris_credentials             = var.polaris_credentials
}

# Add the first Subscription to Rubrik Security Cloud
module "polaris-azure-cloud-native_subscription_1" {
  source                              = "../terraform-azure-polaris-cloud-native_subscription"
  
  azure_service_principal_object_id   = module.polaris-azure-cloud-native_tenant.azure_service_principal_object_id
  azure_subscription_id               = var.subscription_id
  azure_resource_group_name           = "Rubrik-Backups-RG"
  azure_resource_group_region         = "westus"
  azure_resource_group_tags           = {
    "Environment" = "Test"
    "Owner"       = "Terraform" 
  }
  exocompute_details                  = {
    exocompute_config_1 = {
      region                    = "westus"
      subnet_name               = "sn-rubrik-exocompute"
      vnet_name                 = "vnet-rubrik-exocompute"
      vnet_resource_group_name  = "rg-test-exocompute"
      pod_overlay_network_cidr  = "10.244.0.0/16"
    }
  }
  polaris_credentials                 = var.polaris_credentials
  regions_to_protect                  = ["westus"]
  rsc_azure_features                  = [
                                          "AZURE_SQL_DB_PROTECTION",
                                          "AZURE_SQL_MI_PROTECTION",
                                          "CLOUD_NATIVE_ARCHIVAL",
                                          "CLOUD_NATIVE_ARCHIVAL_ENCRYPTION",
                                          "CLOUD_NATIVE_PROTECTION",
                                          "EXOCOMPUTE"
                                        ]
  rsc_service_principal_tenant_domain = module.polaris-azure-cloud-native_tenant.rsc_service_principal_tenant_domain
}
