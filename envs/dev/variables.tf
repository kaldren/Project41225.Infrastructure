// Shared Configuration

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type    = string
  default = "dev"
}

// Key Vault Configuration

variable "kv_name" {
  description = "The name of the Azure Key Vault"
  type        = string
}

variable "kv_sku_name" {
  description = "The SKU name for the Key Vault (e.g., standard, premium)"
  type        = string
}

variable "kv_soft_delete_retention_days" {
  description = "The number of days to retain soft-deleted Key Vaults"
  type        = number
  default     = 90
}

variable "kv_purge_protection_enabled" {
  description = "Whether purge protection is enabled for the Key Vault"
  type        = bool
  default     = false
}

// OpenAI Configuration

variable "openai_name" {
  type = string
}

variable "deployment_name" {
  type = string
}

variable "model_name" {
  type = string
}

variable "model_version" {
  type = string
}
