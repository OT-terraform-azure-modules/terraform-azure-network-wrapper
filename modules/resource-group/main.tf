resource "azurerm_resource_group" "primary_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.tag_map
}

resource "azurerm_management_lock" "primary_lock" {
  count      = var.lock_level_value == "" ? 0 : 1
  name       = "${var.resource_group_name}-level-lock"
  scope      = azurerm_resource_group.primary_rg.id
  lock_level = var.lock_level_value
  notes      = "Resource Group '${var.resource_group_name}' is locked with '${var.lock_level_value}' level"
}
