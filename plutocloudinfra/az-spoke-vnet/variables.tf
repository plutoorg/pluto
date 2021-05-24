variable "hub_virtual_network_id" {
  description = "The id of hub virutal network"
  default     = "/subscriptions/2c93b3a2-056f-4030-91a5-c95219b64438/resourceGroups/rg-pluto-hub/providers/Microsoft.Network/virtualNetworks/vnet-pluto-hub-vnet-uksouth"
}

variable "hub_firewall_private_ip_address" {
  description = "The private IP of the hub virtual network firewall"
  default     = "10.1.0.4"
}

variable "private_dns_zone_name" {
  description = "The name of the Private DNS zone"
  default     = null
}

variable "hub_storage_account_id" {
  description = "The id of hub storage id for logs storage"
  default     = "/subscriptions/2c93b3a2-056f-4030-91a5-c95219b64438/resourceGroups/rg-pluto-hub/providers/Microsoft.Storage/storageAccounts/stdiaglogsplutohubvnet"
}

variable "log_analytics_workspace_id" {
  description = "Specifies the id of the Log Analytics Workspace"
  default     = ""
}

variable "log_analytics_customer_id" {
  description = "The Workspace (or Customer) ID for the Log Analytics Workspace."
  default     = ""
}

variable "log_analytics_logs_retention_in_days" {
  description = "The log analytics workspace data retention in days. Possible values range between 30 and 730."
  default     = ""
}
