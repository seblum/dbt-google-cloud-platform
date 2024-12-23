terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }

  required_version = ">= 1.0.0"

  backend "gcs" {
      bucket  = "tf-state-bucket-l8h28uof"
      prefix  = "terraform/state"
      project = "iac-shared"
    }
}

provider "google" {
  project = local.gcp_project_id
  region  = var.gcp_region
}
