terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0"
    }
  }
  cloud {

    organization = "skybellisllc"

    workspaces {
      name = "Hands-on_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {

  }
  subscription_id                 = "0cfe2870-d256-4119-b0a3-16293ac11bdc"
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  name     = "813-e7eeef82-hands-on-with-terraform-on-azure"
  location = "West US"
}

module "securestorage2" {
  source               = "app.terraform.io/skybellisllc/securestorage2/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "skybellis03"
}