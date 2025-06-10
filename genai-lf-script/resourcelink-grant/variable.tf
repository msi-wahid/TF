variable "resource_link_name" {
  description = "Name for the resource link database in us-east-1"
  type        = string
}

variable "target_database_name" {
  description = "Name of the source database in ap-southeast-3"
  type        = string
}

variable "target_database_catalog_id" {
  description = "AWS Account ID of the source database (in ap-southeast-3)"
  type        = string
}

variable "saml_principal" {
  description = "The SAML principal (IAM role ARN federated via SAML)"
  type        = string
}