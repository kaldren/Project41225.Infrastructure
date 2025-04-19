data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                = var.kv_name
  location            = var.kv_location
  resource_group_name = var.kv_resource_group_name
  sku_name            = var.kv_sku_name
  tenant_id           = var.kv_tenant_id

  soft_delete_retention_days = var.kv_soft_delete_retention_days
  purge_protection_enabled   = var.kv_purge_protection_enabled

  enable_rbac_authorization  = true

  tags = var.kv_tags
}