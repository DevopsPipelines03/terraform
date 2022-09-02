

resource "azurerm_resource_group" "ResourceGroup" {
  name     = var.sundr_resource_group_names
  location = var.location
}



resource "azurerm_storage_account" "sundar_storage" {
  name                     = var.sundar_storage_account_names
  resource_group_name      = azurerm_resource_group.ResourceGroup.name
  location                 = azurerm_resource_group.ResourceGroup.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = azurerm_resource_group.ResourceGroup.tags
  
}

output "sundr_resource_group_names" {
  value = azurerm_resource_group.ResourceGroup.name
}

output "ssundr_resource_group_id" {
  value = azurerm_resource_group.ResourceGroup.id
}
output "sundar_storage_account_names" {
  value = azurerm_storage_account.sundar_storage.name
}

output "sundar_storage_account_id" {
  value = azurerm_storage_account.sundar_storage.id
}