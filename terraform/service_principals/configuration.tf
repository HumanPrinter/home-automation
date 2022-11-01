terraform {
  required_version = ">=1.2.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.29.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.30.0"
    }
  }

  cloud {
    organization = "HumanPrinter"

    workspaces {
      name = "service_principals"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id

  features {}
}
