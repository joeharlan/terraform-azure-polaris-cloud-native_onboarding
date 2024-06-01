variable "azure_tenant_id" {
  type = string
  description = "ID of Azure Tenant to protect."
} 

variable "polaris_credentials" {
  type        = string
  description = "Full path to credentials file for RSC/Polaris."
}

variable "subscription_id" {
    type = string
    description = "Subscription ID for initial AZ CLI context."
}