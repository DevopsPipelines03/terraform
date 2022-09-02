terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.20.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
    subscription_id = "ccb4c6f3-1186-4eb9-8185-575f14c30f7e"   
  tenant_id = "5d6f937a-c760-4c88-8993-5ad91853529f"   
  client_id = "ee0093d5-8950-47c6-9505-1d485b8102cd"
  client_secret = "WWp8Q~XXJcB1_M~_ixpWALx3gkPDIdaGNVUCEaee"
  features {}
}


resource "azurerm_resource_group" "sundar-rg" {
  name     = "sundar-resourcesGroup"
  location = "West Europe"
}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.sundar-rg.name
  address_spaces      = ["10.0.0.0/16", "10.2.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  subnet_service_endpoints = {
    "subnet1" : ["Microsoft.Sql"], 
    "subnet2" : ["Microsoft.Sql"],
    "subnet3" : ["Microsoft.Sql"]
  }

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.sundar-rg]
}