output "resource_group_id" {
  value       = flatten(module.network.*.resource_group_id)
  description = "Resource group id"
}

output "resource_group_name" {
  value       = flatten(module.network.*.resource_group_name)
  description = "Name of the Resource Group Provisioned"
}

output "resource_group_location" {
  value       = flatten(module.network.*.resource_group_location)
  description = "Location of the Resource Group Provisioned"
}

output "vnet_id" {
  value       = flatten(module.network.*.vnet_id)
  description = "The id of the newly created Vnet."
}

output "vnet_name" {
  value       = flatten(module.network.*.vnet_name)
  description = "The Name of the newly created Vnet."
}

output "vnet_location" {
  value       = flatten(module.network.*.vnet_location)
  description = "The location of the newly created Vnet."
}

output "vnet_address_space" {
  value       = flatten(module.network.*.vnet_address_space)
  description = "The address space of the newly created Vnet."
}

output "subnet_id" {
  value       = flatten(module.network.*.subnet_id)
  description = "ID of the subnet"
}

output "subnet_name" {
  value       = flatten(module.network.*.subnet_name)
  description = "Name of the subnet"
}

output "subnet_address_prefixes" {
  value       = flatten(module.network.*.subnet_address_prefixes)
  description = "Address prefixed of the subnet"
}

output "agw_id" {
  value       = flatten(module.network.*.agw_id)
  description = "ID of the Application Gateway"
}

output "agw_subnet_id" {
  value       = flatten(module.network.*.agw_subnet_id)
  description = "ID of the Subnet of Application Gateway"
}
