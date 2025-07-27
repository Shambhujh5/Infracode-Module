# This module creates a Public IP resource in Azure

resource "azurerm_public_ip" "PIP" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = "Basic"
}