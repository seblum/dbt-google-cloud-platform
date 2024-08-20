# DBT Cloud
variable "dbtcloud_token" {
  description = "API token for dbt Cloud"
  type        = string
  sensitive   = true
}

variable "dbtcloud_account_id" {
  description = "Account ID for dbt Cloud"
  type        = string
}

variable "gcp_region" {
  description = "The region to deploy resources"
  type        = string
  default     = "europe-west1"
}