variable "project_name" {
  description = "The name of the Google Cloud project"
  type        = string
}

variable "gcp_project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
}

variable "organization_id" {
  description = "The organization ID under which the project will be created"
  type        = string
}

variable "billing_account_id" {
  description = "The billing account ID to associate with the project"
  type        = string
}

variable "folder_id" {
  description = "Optional folder ID under which the project will be created"
  type        = string
  default     = null
}
