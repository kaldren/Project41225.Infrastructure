resource "azurerm_cognitive_account" "openai" {
  name                = var.ca_name
  location            = var.ca_location
  resource_group_name = var.ca_resource_group_name
  kind                = var.ca_kind
  sku_name            = var.ca_sku_name
  tags                = var.ca_tags
}

resource "azurerm_cognitive_deployment" "gpt4o" {
  name                 = var.cd_name
  cognitive_account_id = azurerm_cognitive_account.openai.id
  model {
    format  = var.cd_model_format    # e.g. "openai"
    name    = var.cd_model_name       # e.g. "gpt-4o-mini"
    version = var.cd_model_version    # e.g. "0718"
  }
  rai_policy_name = var.cd_rai_policy_name

  sku {
    name = var.cd_sku_name
    capacity = var.cd_sku_capacity
  }
}