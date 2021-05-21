output "hostname" {
    value = "${azurerm_virtual_machine.winvm.*.name}"
}

output "host_user_name" {
    #value = "${var.user}"
}

output "host_password" {
  # value = "${local.admin_password}" 
}

output "host_private_ip" {
  value = "${azurerm_network_interface.winni.*.private_ip_address}"
}

output "admin_id" {
  value = "${azurerm_virtual_machine.winvm.*.id}"
}

output "managed_id_spn" {
    value = "${azurerm_virtual_machine.winvm.*.identity.0.principal_id}"
}
