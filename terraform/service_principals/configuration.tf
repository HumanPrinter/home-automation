terraform {
  required_version = ">=1.1.0"

  required_providers {
    azurerm = ">=2.99.0"
    azuread = ">=2.19.1"
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
