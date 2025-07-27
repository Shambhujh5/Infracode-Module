variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string      
}
variable "location" {
  description = "The Azure region where the Key Vault will be created."
  type        = string 
}
variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault will be created."
  type        = string 
}
variable "sku_name" {
  description = "The SKU name for the Key Vault."
  type        = string 
  default     = "standard"
} 
variable "soft_delete_retention_days" {
  description = "The number of days to retain soft-deleted Key Vaults."
  type        = number
  default     = 90
}

variable "purge_protection_enabled" {
  description = "Whether purge protection is enabled for the Key Vault."
  type        = bool
  default     = false
  
}