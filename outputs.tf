
output "resource_group_id" {
  value       = module.resource-group.*.resource_group_id
  description = "Resource group id"
}

output "resource_group_name" {
  value       = module.resource-group.*.resource_group_name
  description = "Name of the Resource Group Provisioned"
}

output "resource_group_location" {
  value       = module.resource-group.*.resource_group_location
  description = "Location of the Resource Group Provisioned"
}

output "vnet_id" {
  value       = module.virtual-network.*.vnet_id
  description = "The id of the newly created Vnet."
}

output "vnet_name" {
  value       = module.virtual-network.*.vnet_name
  description = "The Name of the newly created Vnet."
}

output "vnet_location" {
  value       = module.virtual-network.*.vnet_location
  description = "The location of the newly created Vnet."
}

output "vnet_address_space" {
  value       = module.virtual-network.*.vnet_address_space
  description = "The address space of the newly created Vnet."
}

output "subnet_id" {
  value       = module.subnet.*.subnet_id
  description = "ID of the subnet"
}

output "subnet_name" {
  value       = module.subnet.*.subnet_name
  description = "Name of the subnet"
}

output "subnet_address_prefixes" {
  value       = module.subnet.*.subnet_address_prefixes
  description = "Address prefixed of the subnet"
}

output "agw_id" {
  value       = module.application-gateway.*.agw_id
  description = "ID of the Application Gateway"
}

output "agw_subnet_id" {
  value       = module.application-gateway.*.agw_subnet_id
  description = "ID of the Subnet of Application Gateway"
}