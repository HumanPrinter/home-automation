data "azurerm_client_config" "current_client" {}

data "azurerm_resource_group" "homeautomation" {
  name = "rg-home-homeautomation"
}
