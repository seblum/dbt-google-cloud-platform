
locals {
  gcp_project_name = "data-transformation-dbt"
  gcp_project_id   = "data-transformation-dbt"
}

module "gcp-project" {
  source                 = "../../modules/gcp-project"
  gcp_project_id         = local.gcp_project_id
  gcp_project_name       = local.gcp_project_name
  gcp_billing_account_id = var.gcp_billing_account_id
  gcp_project_services = [
    "bigquery.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com",
    "cloudasset.googleapis.com",
  ]
}
