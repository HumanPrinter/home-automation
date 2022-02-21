output "sp_azuredevops_password" {
  sensitive   = true
  description = "The generated password for the Azure DevOps pipeline service principal"
  value       = azuread_service_principal_password.azuredevops.value
}

output "sp_raspberrypi_password" {
  sensitive   = true
  description = "The generated password for the Raspberry Pi service principal"
  value       = azuread_service_principal_password.raspberrypi.value
}