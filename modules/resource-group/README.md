Azure Resource Group Terraform Module
=====================================

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage]

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

Terraform module which creates Resource Group on Azure and This module will also give you option to add Lock Resource feature into your Resource Group.

Terraform versions
------------------
Terraform 1.0

Usage
------

```hcl
module "res_group" {
  source   = "git::https://github.com/OT-terraform-azure-modules/azure_resource_group.git"
  tag_map  = {
    Name = "azure_rg"
  }
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
| [azurerm_resource_group.primary_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_management_lock.primary_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |

Inputs
------
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource_group_name | (Required) Name of Resource Group | `string` |  | yes |
| resource_group_location | Location where we want to implement code | `string` |  | yes |
| lock_level_value | Specifies the Level to be used for this Lock | `string` | `"CanNotDelete"` | no |
| tag_map | Tag to associate with the Resource Group | `string` | | no |

Output
------
| Name | Description |
|------|-------------|
| resource_group_name | Name of the Resource Group Provisioned |
| resource_group_location | Location of the Resource Group Provisioned |
| resource_group_id | Id of the Resource Group Provisioned |

### Contributors

|  [![Mehul Sharma][mehul_avatar]][mehul_homepage]<br/>[Mehul Sharma][mehul_homepage] |
|---|

  [mehul_homepage]: https://gitlab.com/mehulsharma2010
  [mehul_avatar]: https://gitlab.com/uploads/-/system/user/avatar/7039343/avatar.png?width=400
