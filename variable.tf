variable "rg_name" {
  type        = string
  default     = ""
  description = "The name of the resource group where the resources will be deployed."
}

variable "location" {
  type        = string
  description = "The Azure region where the resources will be deployed."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to apply to all resources."
}

variable "app_name" {
  type        = string
  description = "The name of the Azure App Service."
}

variable "identity_type" {
  type        = string
  description = "The type of identity to assign to the Azure resources."
}

variable "public_network_access_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether the app has public network access."
}

variable "virtual_network_subnet" {
  type        = any
  description = "The subnet ID where the App Service will be deployed."
  default     = null
}

variable "settings" {
  type        = any
  default     = {}
  description = "A map of app settings for the Azure App Service."
}

variable "staging_slot_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether a staging slot is enabled for the Azure App Service."
}

variable "app_service_plan_name" {
  type        = string
  description = "The name of the Azure App Service Plan."
}

variable "create_new_plan" {
  type        = bool
  default     = true
  description = "Set to true if you want to create a new App Service Plan, or false to use an existing one."
}

variable "service_plan_settings" {
  type        = any
  description = "(Optional) The subnet id which will be used by this Web App for regional virtual network integration"
  default = {
    "os_type"      = "Linux",
    "sku"          = "P0v3",
    "worker_count" = "1"
  }
}
