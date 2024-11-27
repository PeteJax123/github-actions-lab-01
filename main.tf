# Specify the provider
provider "azurerm" {
  features {} # Enables the provider; mandatory but can be empty.
}

# Define variables (optional)
variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  default     = "my-resource-group"
}

variable "location" {
  description = "Azure Region where the Resource Group will be created"
  default     = "East US"
}

# Create the resource group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    Environment = "Development"
    Owner       = "YourName"
  }
}

# Output the Resource Group details
output "resource_group_name" {
  description = "The name of the created Resource Group"
  value       = azurerm_resource_group.example.name
}

output "resource_group_location" {
  description = "The location of the created Resource Group"
  value       = azurerm_resource_group.example.location
}
