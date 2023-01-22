provider "azurerm" {
  version = "2.30.0"
}

resource "azurerm_resource_group" "example" {
  name     = "example-rg"
  location = "westus2"
}

resource "azurerm_sql_server" "example" {
  name                         = "example-sql-server"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd123!"
}

resource "azurerm_sql_database" "example1" {
  name                             = "example-db-1"
  resource_group_name              = azurerm_resource_group.example.name
  server_name                      = azurerm_sql_server.example.name
  location                         = azurerm_resource_group.example.location
  collation                        = "SQL_Latin1_General_CP1_CI_AS"
  max_size_bytes                   = "1073741824"
}

resource "azurerm_sql_database" "example2" {
  name                             = "example-db-2"
  resource_group_name              = azurerm_resource_group.example.name
  server_name                      = azurerm_sql_server.example.name
  location                         = azurerm_resource_group.example.location
  collation                        = "SQL_Latin1_General_CP1_CI_AS"
  max_size_bytes                   = "1073741824"
}
