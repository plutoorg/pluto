# Configure the Microsoft Azure as a provider

provider "azurerm" {

  version = "2.46.0"

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  features {}

}

  resource "azurerm_resource_group" "rg" {

      name = var.resource_group_name
      location = "uksouth"
    
  }
