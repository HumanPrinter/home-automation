resource "azuredevops_serviceendpoint_azurecr" "azurecr" {
  project_id                = data.azuredevops_project.home_automation.id
  service_endpoint_name     = "acr_humanprinter"
  resource_group            = azurerm_resource_group.home_homeautomation.name
  azurecr_spn_tenantid      = var.tenant_id
  azurecr_name              = azurerm_container_registry.humanprinter.name
  azurecr_subscription_id   = var.subscription_id
  azurecr_subscription_name = var.subscription_name
  description               = "Service connection with ACR humanprinter - Managed by Terraform"
}