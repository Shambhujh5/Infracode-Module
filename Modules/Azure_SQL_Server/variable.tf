variable "sql-server-name" {    
  description = "The name of the SQL Server."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group where the SQL Server will be created."
  type        = string
}
variable "location" {
  description = "The Azure region where the SQL Server will be created."
  type        = string
}
variable "sql_admin_username" {
  description = "The administrator username for the SQL Server."
  type        = string
}
variable "sql_admin_password" {
  description = "The administrator password for the SQL Server."
  type        = string
  sensitive   = true
}