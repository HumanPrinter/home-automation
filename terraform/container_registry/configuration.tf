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

    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.3.0"
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
