variable "kv_name" {
  description = "The name of the Azure Key Vault"
  type        = string
}

variable "kv_location" {
  description = "The Azure region where the Key Vault will be deployed"
  type        = string
}

variable "kv_resource_group_name" {
  description = "The name of the resource group that will contain the Key Vault"
  type        = string
}

variable "kv_sku_name" {
  description = "The SKU name for the Key Vault (e.g., standard, premium)"
  type        = string
}

variable "kv_tenant_id" {
  description = "The Azure Active Directory tenant ID for the Key Vault"
  type        = string
}

variable "kv_soft_delete_retention_days" {
  description = "The number of days to retain soft-deleted Key Vaults"
  type        = number
  default     = 90
}

variable "kv_purge_protection_enabled" {
  description = "Specifies whether purge protection is enabled for the Key Vault"
  type        = bool
  default     = false
}

variable "access_policies" {
  type = list(object({
    tenant_id           = string
    object_id           = string
    key_permissions     = list(string)
    secret_permissions  = list(string)
    storage_permissions = list(string)
  }))
}

variable "kv_tags" {
  description = "A map of tags to assign to the Key Vault"
  type        = map(string)
  default     = {}
}
