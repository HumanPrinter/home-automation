terraform {
  required_version = ">=1.2.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.35.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.31.0"
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
