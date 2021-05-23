variable "location" {
  type        = string
  description = "The Azure location , either 'UK SOUTH' , 'UK WEST' "
  default     = "UK SOUTH"

}

variable "environment" {
  type        = list(any)
  default     = ["DEV", "TEST", "SIT", "PROD"]
  description = "The Environment e.g. DEV , TEST ,SIT , PROD "
}

variable "vm_admin_user" {
  type        = string
  default     = "Azadmin"
  description = "The VM Default User Name having local admin access"
}

variable "vm_admin_password" {
  type        = string
  description = "Initial Password of VM"
  default     = ""
}

variable "vm_size" {
  type        = string
  description = "The azure instabce size of the VM"
  default     = "Standard_DS1_v2"

}

variable "vm_count" {
  type        = string
  default     = "1"
  description = "Number of VMs to create"
}

variable "managed_disk_type" {
  type        = string
  default     = "Standard_LRS"
  description = "storage tier to be used for persistent disk"

}

variable "disk_size_gb" {
  type        = string
  default     = "200"
  description = "size of persistent disk"

}

variable "operating_system" {
  type        = string
  description = "Os Type and version"
  default     = "Windows Server 2016"

}

variable "vnet_adress_space" {
  type        = list(string)
  description = "vnet address space ip"
}


variable "subnet_address_prefix" {
  type        = list(string)
  description = "subnet address prefix ip "
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




#encryption Options

variable "encrypt_disk" {
  type        = string
  default     = "true"
  description = "Option to enable VMs disk encryption"

}

variable "key_vault_url" {
  type        = string
  description = "URL for the keyvault to be used "
  default     = ""
}

variable "key_vault_resource_id" {
  type        = string
  description = "Resource ID for the keyvault"
  default     = ""

}

variable "key_encryption_algorithm" {
  type        = string
  default     = "RSA-OAEP"
  description = "Key Encryption algorithim to be used for volume encryption"

}

variable "ad_domain" {
  type        = string
  default     = ""
  description = "On Prem AD domain to join VM"

}

# templete prefix value : e.g. Organization name , company name etc. 
variable "prefix" {
  default = "PLUTO-DEV"
}

#source image : publisher 
variable "vm_source_Image_publisher" {
  type        = string
  default     = "MicrosoftWindowsServer"
  description = "azurerm : Vm source_image_reference"
}

#offer
variable "vm_source_Image_offer" {
  type        = string
  default     = "WindowsServer"
  description = "azurerm : Vm source_image_reference : offer"
}

#sku
variable "vm_source_image_sku" {
  type        = string
  default     = "2016-Datacenter"
  description = "azurerm : Vm source_image_reference : SKU "
}

#version 
variable "vm_source_image_version" {
  type        = string
  default     = "latest" #latest
  description = "azurerm : Vm source_image_reference : version "
}
