module "resource_group" {
  source = "../Modules/Azure_Resource_Group"
  resource_group_name     = "TodoInfraRG"
  resource_group_location = "East US"
}

module "key_vault" {
depends_on = [ module.resource_group ]
  source = "../Modules/Azure_Key_Vault"
  key_vault_name          = "TodoInfraKeyVault"
  resource_group_name     = "TodoInfraRG"
  location                = "East US"
  
}
module "vm_username" {
  depends_on = [ module.key_vault ]
  resource_group_name     = "TodoInfraRG"
  source = "../Modules/azurerm_Key_Vault_Secret"
  key_vault_name          = "TodoInfraKeyVault"
  secret_name             = "vmusername"
  secret_value            = "adminuser"
}

module "vm_password" {
  depends_on = [ module.key_vault ]
  source = "../Modules/Azurerm_Key_Vault_Secret"
  resource_group_name     = "TodoInfraRG"
  key_vault_name          = "TodoInfraKeyVault"
  secret_name             = "vmpassword"
  secret_value            = "P@ssw0rd1234!"
}


module "virtual_network" {
  depends_on = [ module.resource_group ]
  source = "../Modules/Azure_Vnet"
  vnet_name =  "TodoVNet"
  resource_group_name     = "TodoInfraRG"
  location                = "East US"
  address_space           = ["10.0.0.0/16"]
}
module "fsubnet" {
  depends_on = [ module.virtual_network ]
  source = "../Modules/Azure_Subnet"
  subnet_name             = "frontend"
  resource_group_name     = "TodoInfraRG"
  vnet_name               = "TodoVNet"
  address_prefixes        = ["10.0.0.0/24"]
}
module "bsubnet" {
  depends_on = [ module.virtual_network ]
  source = "../Modules/Azure_Subnet"
  subnet_name             = "backend"
  resource_group_name     = "TodoInfraRG"
  vnet_name               = "TodoVNet"
  address_prefixes        = ["10.0.1.0/24"]


}
 module "public_ip" {
  depends_on = [ module.resource_group ]
  source = "../Modules/Azure_pip"
  public_ip_name          = "TodoPublicIP"
  resource_group_name     = "TodoInfraRG"
  location                = "East US"
  allocation_method       = "Static"
   
 }
 
module "frontend_vm" {
  depends_on = [ module.resource_group ]
  source = "../Modules/Azure_Virtual_Machine"
  vm_name                 = "TodoFrontendVM"
  resource_group_name     = "TodoInfraRG"
  location                = "East US"
  vm_size                 = "Standard_DS1_v2"
  # admin_username          = module.vm_username.secret_value
  # admin_password          = module.vm_password.secret_value
  image_publisher         = "Canonical"
  image_offer             = "UbuntuServer"  
  image_sku               = "18.04-LTS"
  image_version           = "latest"
  nic_name                = "TodoFrontendNIC"
  frontend_ip_name        = "TodoPublicIP"
  frontend_subnet_name    = "frontend"
  vnet_name               = "TodoVNet"
  key_vault_name          = "TodoInfraKeyVault"
  username_secret_name    = "TodoFrontendUsername"    
  password_secret_name    = "TodoFrontendPassword"

}

# module "Sql_server" {
#   depends_on = [ module.resource_group ]
#   source = "../Modules/Azure_SQL_Server"
#   sql-server-name         = "todosqlServer"
#   resource_group_name     = "TodoInfraRG"
#   location                = "East US"
#   sql_admin_username      = "sqladmin"
#   sql_admin_password      = "P@ssw0rd1234"
  
# }

# module "sql_admin_username" {
#   depends_on = [ module.Sql_server ]
#   source = "../Modules/Azurerm_Key_Vault_Secret"
#   resource_group_name = module.resource_group.name
#   key_vault_name          = module.key_vault.key_vault_name
#   secret_name             = "sqladminusername"
#   secret_value            = "Sqladmin"
  
# }

# module "sql_admin_password" {
#   depends_on = [ module.Sql_server ]
#   source = "../Modules/Azurerm_Key_Vault_Secret"
#   resource_group_name = module.resource_group.name
#   key_vault_name          = module.key_vault.key_vault_name
#   secret_name             = "sqladminpassword"
#   secret_value            = "P@ssw0rd1234!"
  
# }
