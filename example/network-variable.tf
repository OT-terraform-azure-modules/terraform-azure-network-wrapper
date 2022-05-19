variable "create_resource_group" {
  type        = bool
  description = "(Optional) Create resource group?"
  default     = true
}

variable "create_vnet" {
  type        = bool
  description = "(Optional) Create vnet?"
  default     = true
}
variable "create_agw" {
  type        = bool
  description = "(Optional) Create agw?"
  default     = true
}
/*------------------Resource group variable -----------*/
variable "resource_group_name" {
  type        = string
  description = "(Required) Name of Resource Group"
}

variable "resource_group_location" {
  type        = string
  description = "(Required) Location where we want to implement code"
}

variable "lock_level_value" {
  type        = string
  default     = "CanNotDelete"
  description = "(Required) Specifies the Level to be used for this Lock. Possible values are `Empty (no lock)`, `CanNotDelete` and `ReadOnly`. Changing this forces a new resource to be created"
}

/*------------------Vnet variable -----------*/
variable "vnet_name" {
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
  type        = string
}

variable "address_space" {
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space."
  type        = list(any)
}

variable "create_ddos_protection_plan" {
  description = "(Required) Create an ddos plan - Default is false"
  type        = bool
  default     = false
}

variable "dns_servers" {
  description = "(Optional) List of IP addresses of DNS servers"
  type        = list(string)
}

/*------------------Subnet variable -----------*/
variable "subnet_name" {
  description = "The variable for subnet name"
  type        = list(string)
}

variable "subnet_address_prefixes" {
  description = "The CIDR block for the vnet"
  type        = list(string)
}

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet"
  type        = list(string)
  default     = null
}

variable "create_delegation" {
  description = "Creating delegation parameter or not"
  type        = bool
  default     = true
}
variable "delegation_name" {
  description = "Delegation configuration for subnet"
  type        = map(list(any))
  default     = {}
}

variable "enforce_private_link_endpoint_network_policies" {
  description = "(Required) Enable or Disable network policies for the private link endpoint on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy. "
  type        = list(bool)
}
variable "enforce_private_link_service_network_policies" {
  description = "(Required) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy."
  type        = list(bool)
}

/*------------------Agw variable -----------*/

variable "agw_name" {
  type        = string
  description = "Application Gateway Name"
}

variable "agw_address_prefix" {
  type        = list(string)
  description = "Subnet address space"
}

variable "agw_sku" {
  type        = map(string)
  description = "Map to define the sku of the Application Gateway: Standard(Small, Medium, Large) or WAF (Medium, Large), and the capacity (between 1 and 10)"
}

variable "agw_frontend_port" {
  type        = any
  description = "List of FrontEnd Ports and Names"
}

variable "agw_backend_address_pool" {
  type        = any
  description = "List of Backend Address Pool"
}

variable "agw_backend_http_settings" {
  type        = any
  description = "List of Backend HTTP Settings"
}

variable "agw_http_listener" {
  type        = any
  description = "List of HTTP Listners"
}

variable "agw_request_routing_rule" {
  type        = any
  description = "List of Request Routing Rules"
}

variable "public_ip_allocation_method" {
  type        = string
  description = "Type of PUBLIC IP will get allocated"
  default     = "Dynamic"
}

variable "agw_security_rule" {
  type        = list(map(string))
  description = "Please mention the security rules here."
}

variable "tag_map" {
  type        = map(string)
  description = "Map of Tags those we want to Add"
}
# variable "common_tags" {
#   type        = map(string)
#   description = "Map of Tags those we want to Add"
# }
