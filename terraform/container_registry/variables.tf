variable "subscription_id" {
  type        = string
  description = "The ID of the subscription in which the resources are created"
}

variable "subscription_name" {
  type        = string
  description = "The name of the subscription in which the resources are created"
}

variable "tenant_id" {
  type        = string
  description = "The ID of the tenant that holds the AAD"
}

variable "azuredevops_pat" {
  type        = string
  description = "The Personal Access Token that is used to manage resources in Azure DevOps"
  sensitive   = true
}