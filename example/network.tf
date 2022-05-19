provider "azurerm" {
  features {}
}

module "network" {
  source = "../../network"

  create_resource_group   = var.create_resource_group
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  lock_level_value        = var.lock_level_value

  create_vnet                 = var.create_vnet
  vnet_name                   = var.vnet_name
  address_space               = var.address_space
  dns_servers                 = var.dns_servers
  create_ddos_protection_plan = var.create_ddos_protection_plan

  subnet_name                                    = var.subnet_name
  subnet_address_prefixes                        = var.subnet_address_prefixes
  service_endpoints                              = var.service_endpoints
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies

  create_agw                  = var.create_agw
  agw_name                    = var.agw_name
  public_ip_allocation_method = var.public_ip_allocation_method
  agw_sku                     = var.agw_sku
  agw_frontend_port           = var.agw_frontend_port
  agw_backend_address_pool    = var.agw_backend_address_pool
  agw_http_listener           = var.agw_http_listener
  agw_backend_http_settings   = var.agw_backend_http_settings
  agw_request_routing_rule    = var.agw_request_routing_rule
  agw_address_prefix          = var.agw_address_prefix
  agw_security_rule           = var.agw_security_rule

  tag_map = var.tag_map
}