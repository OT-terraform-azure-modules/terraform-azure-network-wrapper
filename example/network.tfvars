create_resource_group                          = true
create_vnet                                    = true
create_agw                                     = false
resource_group_name                            = "test-network-rg"
resource_group_location                        = "centralindia"
lock_level_value                               = ""
address_space                                  = ["10.2.0.0/16"]
vnet_name                                      = "vnet-test"
dns_servers                                    = ["10.2.0.4"]
create_ddos_protection_plan                    = false
subnet_name                                    = ["opensource1", "opensource2", "opensource3"]
subnet_address_prefixes                        = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
enforce_private_link_endpoint_network_policies = [true, false, false]
enforce_private_link_service_network_policies  = [true, false, false]

agw_name                    = "agw-wns-ci"
public_ip_allocation_method = "Dynamic"
agw_sku = {
  name     = "Standard_Small"
  tier     = "Standard"
  capacity = 2
}
agw_frontend_port = [{
  name = "agw_http_frontendPort"
  port = 80
}]
agw_backend_address_pool = [{
  name  = "agw_backend_address_pool"
  fqdns = ["staging.wns.com"]
}]
agw_http_listener = [{
  name                           = "http_listener"
  frontend_ip_configuration_name = "agw-wns-ci"
  host_name                      = "wns.com"
  frontend_port_name             = "agw_http_frontendPort"
  protocol                       = "Http"
}]
agw_backend_http_settings = [{
  name                  = "nginx"
  cookie_based_affinity = "Disabled"
  path                  = ""
  port                  = 80
  protocol              = "Http"
  request_timeout       = 20
}]
agw_request_routing_rule = [{
  name                       = "http_rule"
  rule_type                  = "Basic"
  http_listener_name         = "http_listener"
  backend_address_pool_name  = "agw_backend_address_pool"
  backend_http_settings_name = "nginx"
}]
agw_address_prefix = ["10.90.64.0/26"]
agw_security_rule = [{
  name                       = "http"
  priority                   = 104
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = 80
  destination_port_range     = 80
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  },
  {
    name                       = "https"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = 443
    destination_port_range     = 443
    source_address_prefix      = "*"
    destination_address_prefix = "*"
}]


tag_map = {
  module = "network-infra"
}

