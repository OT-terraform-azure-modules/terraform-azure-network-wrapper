provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

module "resourceGP" {
  source                  = "../"
  resource_group_name     = "myrgtest"
  resource_group_location = "centralindia"
  tag_map = {
    Name = "AzureRG"
  }
}
