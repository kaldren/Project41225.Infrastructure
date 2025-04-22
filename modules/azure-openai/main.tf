
resource "azurerm_openai_account" "openai" {
  name                = var.ca_name
  location            = var.ca_location
  resource_group_name = var.ca_resource_group_name
  sku_name            = var.ca_sku_name        # Example: "S0"
  tags                = var.ca_tags
}

resource "azurerm_openai_deployment" "gpt4o" {
  name                  = var.cd_name
  openai_account_id     = azurerm_openai_account.openai.id
  model_deployment_name = var.cd_model_name     # e.g. "gpt4o-mini"

  model {
    name    = var.cd_model_name       # e.g. "gpt-4o-mini"
    version = var.cd_model_version    # e.g. "2024-07-18"
    format  = var.cd_model_format     # e.g. "OpenAI"
  }

  rai_policy_name = var.cd_rai_policy_name

  sku {
    name     = var.cd_sku_name       # e.g. "Standard"
    capacity = var.cd_sku_capacity   # e.g. 1
  }
}