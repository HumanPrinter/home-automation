resource "azurerm_resource_group" "home_homeautomation" {
  name     = "rg-home-homeautomation"
  location = local.location
  tags     = local.tags
}