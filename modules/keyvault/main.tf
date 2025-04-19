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
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "Set",
      "Delete",
      "List"
    ]

    storage_permissions = [
      "Get",
    ]
  }

  tags = var.kv_tags
}