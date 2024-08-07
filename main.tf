terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.111.0"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "example" {
  name     = "my-terraform-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "mysac23238728ab"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}