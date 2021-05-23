provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-rg"
  location = var.location
}

module "az_vnet_subnet" {

  source             = "../az-vnet"
  prefix             = "${var.prefix}-rg"
  location           = var.location
  resource_grp_name  = azurerm_resource_group.main.name
  vnet_address_space = var.vnet_adress_space
  subnet_ip_frontend = var.subnet_ip_frontend
  subnet_ip_backend  = var.subnet_ip_backend
  subnet_ip_database = var.subnet_ip_database
}

/*
resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-vnet"
  address_space       = var.vnet_adress_space #["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.subnet_address_prefix #"10.0.2.0/24"
} */

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.frontend.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "main" {
  name                = "${var.prefix}-vm"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = var.vm_size #"Standard_F2"
  admin_username      = var.vm_admin_user
  admin_password      = var.vm_admin_password
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  source_image_reference {
    publisher = var.vm_source_Image_publisher #"MicrosoftWindowsServer"
    offer     = var.vm_source_Image_offer     #"WindowsServer"
    sku       = var.vm_source_image_sku       #"2016-Datacenter"
    version   = var.vm_source_image_version   #"latest"
  }

  os_disk {
    storage_account_type = var.managed_disk_type #"Standard_LRS"
    caching              = "ReadWrite"
  }
}
