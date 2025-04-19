variable "ca_name" {
  description = "The name of the Azure OpenAI resource"
  type = string
}

variable "ca_location" {
  description = "The Azure location for the resource"
  type = string
}

variable "ca_kind" {
  description = "The kind of the Azure OpenAI resource"
  type = string
}

variable "ca_sku_name" {
  description = "The SKU name for the Azure OpenAI resource"
  type = string
}

variable "ca_resource_group_name" {
  description = "The name of the resource group for the Azure OpenAI resource"
  type = string
}

variable "ca_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "cd_name" {
  description = "The name of the Azure OpenAI deployment"
  type = string
}

variable "cd_model_name" {
  description = "The name of the model to be deployed"
  type = string
}

variable "cd_model_version" {
  description = "The version of the model to be deployed"
  type = string
}

variable "cd_model_format" {
  description = "The format of the model to be deployed"
  type = string
}

variable "cd_rai_policy_name" {
  description = "The name of the RAI policy to be used for the deployment"
  type = string
}

variable "cd_sku_name" {
  description = "The SKU name for the deployment"
  type = string
}

variable "cd_sku_capacity" {
  description = "The capacity of the SKU for the deployment"
  type = number
}