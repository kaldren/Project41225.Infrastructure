output "kv_uri" {
  description = "The URI of the Azure Key Vault"
  value       = azurerm_key_vault.this.vault_uri
}

output "kv_name" {
  value = azurerm_key_vault.this.name
}