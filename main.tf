
locals {
  gcp_project_name = "DBT Data transformation"
  gcp_project_id   = "seblum-dbt-data-transformation"
}

module "gcp-project" {
  source                 = "./gcp-project"
  gcp_project_id         = local.gcp_project_id
  gcp_project_name       = local.gcp_project_name
  gcp_billing_account_id = var.gcp_billing_account_id
  gcp_project_services = [
    "bigquery.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com",
  ]
}


## Bigquery

module "bigquery-dataset" {
  source           = "./bigquery"
  project_id       = local.gcp_project_id
  bigquery_configs = yamldecode(file("./bigquery_configs.yaml"))
  depends_on       = [module.gcp-project]
}

## DBT IAM Resources


resource "google_service_account" "dbt_service_account" {
  account_id   = local.gcp_project_id
  display_name = "dbt Cloud Service Account"
}

resource "google_service_account_key" "dbt_sa_key" {
  service_account_id = google_service_account.dbt_service_account.name
}

resource "google_project_iam_member" "dbt_service_account_role" {
  project = local.gcp_project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.dbt_service_account.email}"
}