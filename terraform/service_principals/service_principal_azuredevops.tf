resource "azuread_application" "azuredevops" {
  display_name            = "Azure DevOps pipelines"
  prevent_duplicate_names = true
  logo_image              = filebase64("artifacts/azuredevops_pipelines.png")
  owners                  = [data.azuread_client_config.current_client.object_id]
}

resource "azuread_service_principal" "azuredevops" {
  description                  = "Service Principal for pushing Docker images from Azure DevOps"
  notification_email_addresses = ["o_brouwer@hotmail.com"]
  owners                       = [data.azuread_client_config.current_client.object_id]
  application_id               = azuread_application.azuredevops.application_id
}

resource "azuread_service_principal_password" "azuredevops" {
  display_name         = "AzureDevOps-sp password"
  service_principal_id = azuread_service_principal.azuredevops.id
}
