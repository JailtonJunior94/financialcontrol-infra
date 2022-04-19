terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "storageterraformjj"
    container_name       = "financialcontrol-infra"
    key                  = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.71.0"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "digitalocean" {}
