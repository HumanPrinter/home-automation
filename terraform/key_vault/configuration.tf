terraform {
  required_version = ">=1.1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.25.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.29.0"
    }
  }

  cloud {
    organization = "HumanPrinter"

    workspaces {
      name = "key_vault"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id

  features {}
}
