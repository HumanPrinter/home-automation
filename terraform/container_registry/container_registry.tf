resource "azurerm_container_registry" "humanprinter" {
  name                   = "humanprinter"
  resource_group_name    = azurerm_resource_group.home_homeautomation.name
  location               = azurerm_resource_group.home_homeautomation.location
  sku                    = "Basic"
  admin_enabled          = false
  anonymous_pull_enabled = false
  tags                   = local.tags
}

resource "azurerm_role_assignment" "raspberrypi" {
  scope                = azurerm_container_registry.humanprinter.id
  role_definition_name = "AcrPull"
  principal_id         = data.azuread_service_principal.raspberrypi.id
}

resource "azurerm_role_assignment" "azuredevops" {
  scope                = azurerm_container_registry.humanprinter.id
  role_definition_name = "AcrPush"
  principal_id         = data.azuread_service_principal.azuredevops.id
}
