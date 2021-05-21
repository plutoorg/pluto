variable "location" {
  type        = string
  description = "The Azure location , either 'UK SOUTH' , 'UK WEST' "
  default     = "UK SOUTH"

}

variable "environment" {
  type        = list
  default     = ["DEV", "TEST", "SIT", "PROD"]
  description = "The Environment e.g. DEV , TEST ,SIT , PROD "
}

variable "user" {
  type        = string
  default     = "Azadmin"
  description = "The VM Default User Name having local admin access"
}

variable "user_password" {
  type        = string
  description = "Initial Password of VM"
  default     = ""

}

variable "size" {

  type        = string
  description = "The azure instabce size of the VM"

}

variable "count" {
  type        = string
  default     = "1"
  description = "Number of VMs to create"
}

variable "managed_disk_type" {
  type        = string
  ddefault    = "Standard_LRS"
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

variable "prefix" {
  default = "PLUTO-DEV"
}
