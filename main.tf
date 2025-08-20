# Azure Resource Group Terraform Configuration

provider "azurerm" {
  features {}
}

# Call the Resource Group module
module "resource_group" {
  source = "./modules/resource-group"
  
  # Resource Group configuration
  resource_group_name = var.resource_group_name
  location            = var.location

}

# Output values
output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.resource_group.resource_group_name
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = module.resource_group.resource_group_id
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = module.resource_group.resource_group_location
}
