resource "azuread_application" "raspberrypi" {
  display_name            = "Raspberry Pi"
  prevent_duplicate_names = true
  logo_image              = filebase64("artifacts/raspberrypi.jpg")
  owners                  = [data.azuread_client_config.current_client.object_id]
}

resource "azuread_service_principal" "raspberrypi" {
  description                  = "Service Principal for pulling Docker images from Raspberry Pi Docker hosts"
  notification_email_addresses = ["o_brouwer@hotmail.com"]
  owners                       = [data.azuread_client_config.current_client.object_id]
  application_id               = azuread_application.raspberrypi.application_id
}

resource "azuread_service_principal_password" "raspberrypi" {
  display_name         = "Raspberry-sp password"
  service_principal_id = azuread_service_principal.raspberrypi.id
}
