terraform {
  required_version = ">=1.1.0"

  required_providers {
    azurerm     = ">=2.97.0"
    azuread     = ">=2.18.0"
  }

  backend "azurerm" {
    storage_account_name = "sahomeautomationtfstate"
    container_name       = "tfstate"
    key                  = "homeautomation-service_principals.tfstate"
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id

  features {}
}
