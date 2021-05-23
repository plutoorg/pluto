variable "prefix" {
  description = "The prefix used for all resources"
}

variable "location" {
  description = "The Azure location where all resources should be created"
}

variable "resource_grp_name" {
  dedescription = "root resource group name "
}

variable "subnet_ip_frontend" {
  description = "frontend subnet ip "
}

variable "subnet_ip_backend" {
  description = "backend subnet ip"
}

variable "subnet_ip_database" {
  desdescription = "databse subnet ip"
}
variable "vnet_address_space" {
  description = "vnet Address space"
}
