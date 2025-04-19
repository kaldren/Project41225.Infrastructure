data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                = var.kv_name
  location            = var.kv_location
  resource_group_name = var.kv_resource_group_name
  sku_name            = var.kv_sku_name
  tenant_id           = var.kv_tenant_id

  soft_delete_retention_days = var.kv_soft_delete_retention_days
  purge_protection_enabled   = var.kv_purge_protection_enabled

  access_policy {
    for_each = { for policy in var.access_policies : "${policy.object_id}" => policy }

    tenant_id = each.value.tenant_id
    object_id = each.value.object_id
    key_permissions = each.value.key_permissions
    secret_permissions = each.value.secret_permissions
    storage_permissions = each.value.storage_permissions
  }

  tags = var.kv_tags
}