Azure Network Terraform module
=====================================

Terraform versions
------------------
Terraform 1.1.7

Usage
------

```hcl
provider "azurerm" {
  features {}
}

module "network" {
  source                      = "https://Millennial-Mobile-App@dev.azure.com/Millennial-Mobile-App/Platform/_git/Platform"
  create_resource_group       = "_"
  create_subnet               = "_"
  create_agw                  = "_"
  resource_group_name         = "_"
  resource_group_location     = "_"
  address_space               = ["_"]
  vnet_name                   = "_"	
  dns_servers                 = ["_", "_"]
  create_ddos_protection_plan = "_"
  subnet_name                 = ["_", "_"]
  subnet_address_prefixes     = ["_", "_"]
  delegation_name             = "_"
  delegation_service_name     = "_"
  service_endpoints           = ["_", "_"]
  delegation_actions          = ["_", "_"]
  agw_name                    = "_"
  agw_sku = {
    name     = "_"
    tier     = "_"
    capacity = _
  }
  agw_frontend_port = [{
    name = "_"
    port = _
  }]
  agw_backend_address_pool = [{
    name  = "_"
    fqdns = ["_"]
  }]
  agw_http_listener = [{
    name                           = "_"
    frontend_ip_configuration_name = "_"
    host_name                      = "_"
    frontend_port_name             = "_"
    protocol                       = "_"
  }]
  agw_backend_http_settings = [{
    name                  = "_"
    cookie_based_affinity = "_"
    path                  = "_"
    port                  = "_"
    protocol              = "_"
    request_timeout       = _
  }]
  agw_request_routing_rule = [{
    name                       = "_"
    rule_type                  = "_"
    http_listener_name         = "_"
    backend_address_pool_name  = "_"
    backend_http_settings_name = "_"
  }]
  agw_address_prefix = ["_"]
  agw_security_rule = [{
    name                       = "_"
    priority                   = _
    direction                  = "_"
    access                     = "_"
    protocol                   = "_"
    source_port_range          = _
    destination_port_range     = _
    source_address_prefix      = "_"
    destination_address_prefix = "_"
    },
    {
      name                       = "_"
      priority                   = _
      direction                  = "_"
      access                     = "_"
      protocol                   = "_"
      source_port_range          = _
      destination_port_range     = _
      source_address_prefix      = "_"
      destination_address_prefix = "_"
  }]
}

```

Tags
----
* Tags are assigned to resources with name variable as prefix.
* Additial tags can be assigned by tags variables as defined above.

Resources
------
| Name | Type |
|------|------|
| [Azure Resource Group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [Azure Virtual Network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [Azure subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [Azure Application Gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_gateway) | resource |

Inputs
------
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create_resource_group | create resource group | `bool` | `true` | Yes |
| create_vnet | create vnet | `bool` | `true` | Yes |
| create_subnet | create subnet | `bool` | `true` | Yes |
| create_agw | create agw | `bool` | `true` | Yes |
| resource_group_name | (Required) Name of Resource Group | `string` |  | yes |
| resource_group_location | Location where we want to implement code | `string` |  | yes |
| lock_level_value | Specifies the Level to be used for this Lock | `string` | `"CanNotDelete"` | no |
| vnet_name | The name of the virtual network. Changing this forces a new resource to be created. | `string` |  | Yes |
| address_space | The address space that is used the virtual network. You can supply more than one address space. | `list(string)` |  | yes |
| create_ddos_protection_plan | Create an ddos plan - Default is false | `bool` | `false` | No |
| dns_servers | List of IP addresses of DNS servers | `list(string)` |  | No |
| subnet_name | Name of the subnet | `list(string)` |  | yes |
| subnet_address_prefixes | Address prefix to associate with the subnet | `list(string)` | | yes |
| delegation_name  | A name for this delegation | `string` |  | yes |
| delegation_service_name |The service to which it is delegated | `string` |  | yes |
| delegation_actions | A list of Actions which should be delegated | `list(string)` | | yes |
| service_endpoints  | The list of Service endpoints to associate with the subnet| `list(string)` |  | yes |
| agw_address_prefix | The address prefixes to use for the subnet | `list(string)` |  | yes |
| agw_name | Application Gateway name | `string` |  | yes |
| sku | Map to define the sku of the Application Gateway: Standard(Small, Medium, Large) or WAF (Medium, Large), and the capacity (between 1 and 10) | `map(string)` |  | yes |
| agw_frontend_port | List of FrontEnd Ports and Names | `any` |  | yes |
| agw_backend_address_pool | List of Backend Address Pool | `any` |  | yes |
| agw_backend_http_settings | List of Backend HTTP Settings | `any` |  | yes |
| agw_http_listener | List of HTTP Listners | `any` |  | yes |
| agw_request_routing_rule | List of Request Routing Rules | `any` | `` | yes |
| public_ip_allocation_method | Allocation method for the public IP | `string` | `"Dynamic"` | no |
| agw_security_rule | Please mention the security rules here | `string` |  | yes |
| tag_map | Tag to associate with the Resource Group | `map(string)` | | no |


Output
------
| Name | Description |
|------|-------------|
| resource_group_name | Name of the Resource Group Provisioned |
| resource_group_location | Location of the Resource Group Provisioned |
| resource_group_id | Id of the Resource Group Provisioned |
| vnet_id | The id of the newly created Vnet. |
| vnet_name | The Name of the newly created Vnet |
| vnet_location | The location of the newly created Vnet |
| vnet_address_space | The address space of the newly created Vnet |
| subnet_id | This variable will give all the details of Subnets |
| agw_id | ID of the Application Gateway |
| agw_subnet_id | ID of the Subnet created with Application Gateway |


## Related Projects

Check out these related projects.
--------------------------------
* [Azure Resource Group](https://registry.terraform.io/modules/OT-terraform-azure-modules/resource-group/azure/latest)
* [Azure Virtual Network](https://registry.terraform.io/modules/OT-terraform-azure-modules/virtual-network/azure/latest)
* [Azure subnet](https://registry.terraform.io/modules/OT-terraform-azure-modules/subnet/azure/latest)
* [Azure Application Gateway](https://registry.terraform.io/modules/OT-terraform-azure-modules/application-gateway/azure/latest)
