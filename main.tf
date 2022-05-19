locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.existing-resource-group.*.name, module.resource-group.*.resource_group_name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.existing-resource-group.*.location, module.resource-group.*.resource_group_location, [""]), 0)
  vnet_name           = element(coalescelist(data.azurerm_virtual_network.existing-virtual-network.*.name, module.virtual-network.*.vnet_name, [""]), 0)
}

module "resource-group" {
  count                   = var.create_resource_group == true ? 1 : 0
  source                  = "./modules/resource-group"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  lock_level_value        = var.lock_level_value
  tag_map                 = var.tag_map
}

data "azurerm_resource_group" "existing-resource-group" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

module "virtual-network" {
  count                       = var.create_vnet == true ? 1 : 0
  source                      = "./modules/virtual-network"
  resource_group_name         = local.resource_group_name
  resource_group_location     = var.resource_group_location
  address_space               = var.address_space
  vnet_name                   = var.vnet_name
  dns_servers                 = var.dns_servers
  create_ddos_protection_plan = var.create_ddos_protection_plan
  tag_map                     = var.tag_map
}

data "azurerm_virtual_network" "existing-virtual-network" {
  count               = var.create_vnet == false ? 1 : 0
  name                = var.vnet_name
  resource_group_name = local.resource_group_name
}

module "subnet" {
  count                   = length(var.subnet_name) != null ? 1 : 0
  source                  = "./modules/subnet"
  resource_group_name     = local.resource_group_name
  vnet_name               = local.vnet_name
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  delegation_name         = var.delegation_name
  service_endpoints       = var.service_endpoints
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies
}

module "application-gateway" {
  count                       = var.create_agw == true ? 1 : 0
  source                      = "./modules/application-gateway"
  agw_name                    = var.agw_name
  agw_resource_group_name     = local.resource_group_name
  agw_resource_group_location = var.resource_group_location
  agw_vnet_name               = local.vnet_name
  request_routing_rule        = var.agw_request_routing_rule
  http_listener               = var.agw_http_listener
  backend_http_settings       = var.agw_backend_http_settings
  backend_address_pool        = var.agw_backend_address_pool
  frontend_port               = var.agw_frontend_port
  sku                         = var.agw_sku
  agw_address_prefix          = var.agw_address_prefix
  agw_security_rule           = var.agw_security_rule
  tag_map                     = var.tag_map
}
