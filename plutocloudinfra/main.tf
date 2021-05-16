# Configure the Microsoft Azure as a provider

provider "azurerm" {

  version = "2.46.0"

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  features {}

}


variable "resource_group_names" {
    type = map
    default = {
        dev = "az-dev-rg"
        staging = "az-staging-rg"
        prod = "az-prod-rg"
    }
  
}

  resource "azurerm_resource_group" "rg" {

      name = var.resource_group_names[terraform.workspace]
      location = "uksouth"
    
  }
