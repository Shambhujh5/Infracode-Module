resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql-server-name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
}