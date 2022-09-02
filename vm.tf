# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = "3.19.1"
      
#     }
    
#   }
# }

# provider "azurerm" {
#   # Configuration options
#   subscription_id = "ccb4c6f3-1186-4eb9-8185-575f14c30f7e"
#   tenant_id = "5d6f937a-c760-4c88-8993-5ad91853529f"
#   client_id = "ee0093d5-8950-47c6-9505-1d485b8102cd"
#   client_secret = "WWp8Q~XXJcB1_M~_ixpWALx3gkPDIdaGNVUCEaee"
#    features {}
 
# }

# # Configure the Microsoft Azure Provider

# # Create a resource group
# resource "azurerm_resource_group" "rg" {
#   name     = "sundarrg"
#   location = "West Europe"
# }



# resource "azurerm_virtual_network" "terraformvnet" {
#   name                = "sundar-vnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
# }

# resource "azurerm_subnet" "terraformsubnets" {
#   name                 = "sundar-subnet"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.terraformvnet.name
#   address_prefixes     = ["10.0.2.0/24"]
# }

# resource "azurerm_network_interface" "interfaces" {
#   name                = "myvm1-nic"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   ip_configuration {
#     name                          = "sundarip"
#     subnet_id                     = azurerm_subnet.terraformsubnets.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_windows_virtual_machine" "sundarvm" {
#   name                = "terraformvm"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   size                = "Standard_F2"
#   admin_username      = "admin123"
#   admin_password      = "admin123@"
#   network_interface_ids = [
#     azurerm_network_interface.interfaces.id,
#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2019-Datacenter"
#     version   = "latest"
#   }
# }





# Main API Header File (users to manage an external API) 
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.19.1"
      
    }
    
  }
}

# Header File
# Configure the Microsoft Azure Provider
provider "azurerm" {
 
  subscription_id = "ccb4c6f3-1186-4eb9-8185-575f14c30f7e"   
  tenant_id = "5d6f937a-c760-4c88-8993-5ad91853529f"   
  client_id = "ee0093d5-8950-47c6-9505-1d485b8102cd"
  client_secret = "WWp8Q~XXJcB1_M~_ixpWALx3gkPDIdaGNVUCEaee"
  features {}
 
}

# this header file of resouce group
# Create a resource group
# resource "azurerm_resource_group" "ResourceGroup" {
#   name     = "sundarResoucegroup"
#   location = "West Europe"
# }



# Create a azurerm_virtual_network
# resource "azurerm_virtual_network" "sundarVnet" {
#   name                = "sundar-vnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.ResourceGroup.location
#   resource_group_name = azurerm_resource_group.ResourceGroup.name
# }




# # Create a azurerm_subnet
# resource "azurerm_subnet" "sundar_subnet" {
#   name                 = "sundar-subnet"
#   resource_group_name  = azurerm_resource_group.ResourceGroup.name
#   virtual_network_name = azurerm_virtual_network.sundarVnet.name
#   address_prefixes     = ["10.0.2.0/24"]
# }




# # Create a azurerm_network_interface
# resource "azurerm_network_interface" "sundar_network_interfaces" {
#   name                = "myvm1-nic"
#   location            = azurerm_resource_group.ResourceGroup.location
#   resource_group_name = azurerm_resource_group.ResourceGroup.name

#   ip_configuration {
#     name                          = "sundarip"
#     subnet_id                     = azurerm_subnet.sundar_subnet.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }




# # Create a azurerm_windows_virtual_machine
# resource "azurerm_windows_virtual_machine" "sundrrajanVm" {
#   name                = "MyfirstVm"
#   resource_group_name = azurerm_resource_group.ResourceGroup.name
#   location            = azurerm_resource_group.ResourceGroup.location
#   size                = "Standard_F2"
#   admin_username      = "admin123"
#   admin_password      = "admin123@"
#   network_interface_ids = [
#     azurerm_network_interface.sundar_network_interfaces.id,
#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2019-Datacenter"
#     version   = "latest"
#   }
# }