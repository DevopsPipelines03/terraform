module "Storage1" {
  
  source = "./modules/StorageAccount"
  sundr_resource_group_names="sundarrgs"
  sundar_storage_account_names="sundarstorages"
  location="West Europe"


}

module "Storage2" {
  
  source = "./modules/StorageAccount"
  sundr_resource_group_names="sundarrgs1"
  sundar_storage_account_names="sundarstorages1"
  location="West Europe"


}

resource "azurerm_storage_container" "example" {
  name                  = "vhds"
  storage_account_name  = module.Storage2.sundar_storage_account_names
  container_access_type = "private"
  depends_on = [
    module.Storage2
  ]
}

output "Storage2" {
    value = module.Storage2.sundar_storage_account_id
  
}
