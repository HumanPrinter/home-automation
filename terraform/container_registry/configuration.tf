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

    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.2.2"
    }
  }

  cloud {
    organization = "HumanPrinter"

    workspaces {
      name = "container_registry"
    }
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
