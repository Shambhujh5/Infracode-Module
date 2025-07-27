variable "resource_group_name" {
  description = "The name of the resource group where the VM will be created."
  type        = string                      
  
}
variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}
variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}
variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_DS1_v2"
}
# variable "admin_username" {
#   description = "The administrator username for the virtual machine."
#   type        = string
# }   
# variable "admin_password" {
#   description = "The administrator password for the virtual machine."
#   type        = string
#   sensitive   = true
# }
variable "image_publisher" {
  description = "The publisher of the image to use for the virtual machine."
  type        = string
  
}
variable "image_offer" {
  description = "The offer of the image to use for the virtual machine."
  type        = string
  
}
variable "image_sku" {
  description = "The SKU of the image to use for the virtual machine."
  type        = string
  
}
variable "image_version" {
  description = "The version of the image to use for the virtual machine."
  type        = string

}
variable "nic_name" {
  description = "The name of the network interface to be created."
  type        = string
}
variable "frontend_ip_name" {
  description = "The name of the public IP address to be created for the VM."
  type        = string

}
variable "frontend_subnet_name" {
  description = "The name of the subnet where the VM will be deployed."
  type        = string
}
variable "vnet_name" {
  description = "The name of the virtual network where the VM will be deployed."
  type        = string
}
variable "key_vault_name" {
  description = "The name of the Key Vault where secrets will be stored."
  type        = string

}
variable "username_secret_name" {
  description = "The name of the Key Vault secret for the VM username."
  type        = string
  
}
variable "password_secret_name" {
  description = "The name of the Key Vault secret for the VM password."
  type        = string
  
}
