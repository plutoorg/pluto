# Configure the Microsoft Azure as a provider

provider "azurerm" {

  #version = "3.0.1 "

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  features {}

}

variable "resource_group_names" {
  type = map(any)
  default = {
    dev     = "az-dev-rg"
    staging = "az-staging-rg"
    prod    = "az-prod-rg"
  }

}

module "windows_vm" {

  source = "./tf-modules/az-compute/windows_vm"

}
