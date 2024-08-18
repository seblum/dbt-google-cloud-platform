terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
    dbt = {
      source  = "fishtown-analytics/dbt-cloud"
      version = ">= 0.0.1"
    }
  }

  required_version = ">= 1.0.0"
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

provider "dbt" {
  api_token = var.dbt_api_token
}
