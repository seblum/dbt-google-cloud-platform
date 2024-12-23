variable "gcp_project_name" {
  description = "The name of the Google Cloud project"
  type        = string
}

variable "gcp_project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
}

variable "gcp_project_services" {
  description = "The list of Google Cloud services to enable for the project"
  type        = list(string)
  default     = []
}

variable "auto_create_network" {
  description = "Whether to automatically create a VPC network for the project"
  type        = bool
  default     = false
}

variable "gcp_billing_account_id" {
  description = "The billing account ID"
  type        = string
}