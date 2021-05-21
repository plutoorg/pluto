
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-RG"
  location = "West Europe"
}

resource "random_string" "random_string_user" {
  length           = 16
  special          = true
  override_special = "/@£$"
}
resource "random_password" "randomadmin_password" {
  length            = 16
  special           = true
  override_special  = "_%@"
}

resource "azurem_virtual_machine" "winvm" {
    count                           = "${var.count}" 
    Name                            = "${local.prefix} ${radom_string.random_string_user.result}"
    location                        = "${var.location}"
    resource_group_name             = "${azurerm_resource_group.rg.name}"
    vm_size                         = "${var.size}"
    admin_username                  = "${var.user}"
    admin_password                  = random_password.randomadmin_password.result

    os_disk {
    caching                          = "ReadWrite"
    storage_account_type             = "Standard_LRS"
  }

  source_image_reference {
    publisher                         = "MicrosoftWindowsServer"
    offer                             = "WindowsServer"
    sku                               = "2016-Datacenter"
    version                           = "latest"
  }
}