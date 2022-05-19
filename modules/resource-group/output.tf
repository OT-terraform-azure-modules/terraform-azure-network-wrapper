output "resource_group_id" {
  value       = azurerm_resource_group.primary_rg.id
  description = "Resource group id"
}

output "resource_group_name" {
  description = "Name of the Resource Group Provisioned"
  value       = azurerm_resource_group.primary_rg.name
}

output "resource_group_location" {
  description = "Location of the Resource Group Provisioned"
  value       = azurerm_resource_group.primary_rg.location
}
