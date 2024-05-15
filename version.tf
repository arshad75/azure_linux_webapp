terraform {
  required_version = ">= 1.4.0, < 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.81.0, < 3.93.0"
    }
  }
}

provider "azurerm" {
  features {}
}
