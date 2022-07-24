data "azurerm_client_config" "current_client" {}

data "azuread_user" "administrator" {
  user_principal_name = "o_brouwer_hotmail.com#EXT#@humanprinter.onmicrosoft.com"
}

data "azurerm_resource_group" "homeautomation" {
  name = "rg-home-homeautomation"
}
