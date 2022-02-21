output "sp_azuredevops_appid" {
  description = "The generated App ID for the Azure DevOps pipeline service principal"
  value       = azuread_application.azuredevops.application_id
}

output "sp_azuredevops_password" {
  sensitive   = true
  description = "The generated password for the Azure DevOps pipeline service principal"
  value       = azuread_service_principal_password.azuredevops.value
}

output "sp_raspberrypi_appid" {
  description = "The generated App ID for the Raspberry Pi service principal"
  value       = azuread_application.raspberrypi.application_id
}

output "sp_raspberrypi_password" {
  sensitive   = true
  description = "The generated password for the Raspberry Pi service principal"
  value       = azuread_service_principal_password.raspberrypi.value
}