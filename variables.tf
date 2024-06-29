variable "azure_tenant_id" {
  type = string
  description = "ID of Azure Tenant being added for protection."
} 

variable "polaris_credentials" {
  type        = string
  description = "Full path to credentials file for Rrubrik Security Cloud API Service Account."
}

variable "subscription_id" {
    type = string
    description = "Subscription ID for initial Az CLI context."
}

