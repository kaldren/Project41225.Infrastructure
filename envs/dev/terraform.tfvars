resource_group_name = "rg-use-project41225-dev"
location            = "eastus"
tenant_id          = "06209c3c-8ca6-4b1e-96a1-f2458effd850"
subscription_id      = "25a1ac98-4092-4447-9085-2aeaec93d823"
project_name         = "project41225"
environment         = "dev"

// OpenAI Configuration
openai_name          = "opai-use-dev"
deployment_name       = "gpt4o-mini"
model_name            = "gpt-4o-mini"
model_version         = "2024-07-18"

// Key Vault Configuration
kv_name                       = "kv-project41225-use-dev"
kv_sku_name                   = "standard"
kv_soft_delete_retention_days = 30
kv_purge_protection_enabled   = true