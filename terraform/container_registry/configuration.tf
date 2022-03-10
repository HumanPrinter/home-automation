terraform {
  required_version = ">=1.1.0"

  required_providers {
    azurerm = ">=2.97.0"
    azuread = ">=2.18.0"

    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.8"
    }
  }

  backend "azurerm" {
    storage_account_name = "sahomeautomationtfstate"
    container_name       = "tfstate"
    key                  = "homeautomation-container_registry.tfstate"
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id

  features {}
}

provider "azuredevops" {
  org_service_url       = "https://dev.azure.com/humanprinter"
  personal_access_token = var.azuredevops_pat
}
