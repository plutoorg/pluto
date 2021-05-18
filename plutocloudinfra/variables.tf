variable "tenant_id" {
  type        = string
  default     = ""
  description = "Azure Tenant  ID"

}

variable "client_secret" {
  type        = string
  default     = ""
  description = "Azure client secret ID"

}

variable "subscription_id" {
  type        = string
  default     = ""
  description = "Azure Subscription ID"

}
variable "client_id" {
  type        = string
  default     = ""
  description = "Azure Client ID"
}

variable "prefix" {
  type = string
  default = "pluto" # e.g. -  Project Name can be use as prefix
  
}

variable "name" {
  
}