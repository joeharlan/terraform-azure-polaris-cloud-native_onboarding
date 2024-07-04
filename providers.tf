terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
    }
    azurerm = {
        source = "hashicorp/azurerm"
    }
    polaris = {
      source  = "rubrikinc/polaris"
      version = ">=0.9.0-beta.8"
    } 
  }
}

# Configure the Azure Active Directory Provider
provider "azuread" {
  tenant_id = var.azure_tenant_id
}

# Point the provider to the RSC service account to use.
provider "polaris" {
  credentials = var.polaris_credentials
} 

# Initialize the Azure RM provider from the shell environment.
provider "azurerm" {
  skip_provider_registration = "true"
  features {}
  subscription_id = var.subscription_id
}
