# GCP variables

variable "gcp_region" {
  description = "The region to deploy resources"
  type        = string
  default     = "europe-west1"
}

variable "gcp_billing_account_id" {
  description = "The billing account ID"
  type        = string
}

variable "oidc_provider_principalSet" {
  description = "The OIDC provider principalSet"
  type        = string
}