module "resource_group" {
  source   = "../../modules/resource-group"
  rg_name     = var.resource_group_name
  rg_location = var.location
  rg_tags     = {
    environment = var.environment
    project     = var.project_name
  }
}

module "azure_openai" {
  source                    = "../../modules/azure-openai"
  ca_name                   = var.openai_name
  ca_location               = var.location
  ca_resource_group_name    = var.resource_group_name
  ca_kind                   = "OpenAI"                   # or from var.ca_kind
  ca_sku_name               = "S0"                       # or from var.ca_sku_name

  cd_name                   = var.deployment_name
  cd_model_format           = "OpenAI"                   # or from var.model_format
  cd_model_name             = var.model_name
  cd_model_version          = var.model_version
  cd_rai_policy_name        = "Microsoft.Default"        # or from var.rai_policy
  cd_sku_name               = "Standard"                 # or from var.cd_sku_name
  cd_sku_capacity           = 1                          # or from var.cd_sku_capacity

  ca_tags = {
    environment = var.environment
    project     = var.project_name
  }

  depends_on = [module.resource_group]
}

module "keyvault" {
  source                      = "../../modules/keyvault"
  kv_name                     = var.kv_name
  kv_location                 = var.location
  kv_resource_group_name      = var.resource_group_name
  kv_sku_name                 = var.kv_sku_name
  kv_tenant_id                = var.tenant_id
  kv_soft_delete_retention_days = var.kv_soft_delete_retention_days
  kv_purge_protection_enabled   = var.kv_purge_protection_enabled

  access_policies = [
    {
      tenant_id           = data.azurerm_client_config.current.tenant_id
      object_id           = data.azurerm_client_config.current.object_id
      key_permissions     = ["get", "list"]
      secret_permissions  = ["get", "list", "set"]
      storage_permissions = []
    },
    {
      tenant_id           = data.azurerm_client_config.current.tenant_id
      object_id           = data.azurerm_client_config.current.object_id
      key_permissions     = []
      secret_permissions  = ["get"]
      storage_permissions = ["get"]
    }
  ]

  kv_tags                     = {
    environment = var.environment
    project     = var.project_name
  }

  depends_on = [module.resource_group]
}
