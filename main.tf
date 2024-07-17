terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {
    organization = "teststworks"

    workspaces {
      name = "Handsonlabwithterraform"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-e5ab856f-hands-on-with-terraform-on-azure"
  location = "westus"
}

module "securestorages" {
  source               = "app.terraform.io/teststworks/securestorages/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "ststg599"
}