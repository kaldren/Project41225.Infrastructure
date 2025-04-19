output "kv_uri" {
  description = "Key Vault URI from the keyvault module"
  value       = module.keyvault.kv_uri
}

output "kv_name" {
  value = module.keyvault.kv_name
}
