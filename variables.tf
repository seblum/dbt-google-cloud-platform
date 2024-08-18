

## Bigquery


variable "gcp_project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
}

variable "gcp_region" {
  description = "The region where resources will be created"
  type        = string
  default     = "us-central1"
}

variable "dbt_api_token" {
  description = "API token for dbt Cloud"
  type        = string
  sensitive   = true
}

variable "bigquery_dataset_id" {
  description = "The ID of the BigQuery dataset"
  type        = string
  default     = "dbt_quickstart_dataset"
}

variable "bigquery_table_id" {
  description = "The ID of the BigQuery table"
  type        = string
  default     = "dbt_quickstart_table"
}
