terraform {
  required_version = ">=1.1.0"

  required_providers {
    azurerm     = ">=2.97.0"
  }

  backend "azurerm" {
    storage_account_name = "sahomeautomationtfstate"
    container_name       = "tfstate"
    key                  = "homeautomation-key_vault.tfstate"
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id

  features {}
}