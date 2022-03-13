data "azuredevops_project" "home_automation" {
  name = "Home Automation"
}

data "azuread_service_principal" "raspberrypi" {
  display_name = "Raspberry Pi"
}

data "azuread_service_principal" "azuredevops" {
  display_name = "Azure DevOps pipelines"
}
