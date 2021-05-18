output "user" {
    value = "${var.user}"
}

output "private_ip" {
  value = "${azurerm_network_interface.winni.*.private_ip_address}"
}

output "hostname" {
    value = "${azurerm_virtual_machine.winvm.*.name}"

}

