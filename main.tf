
locals {
  gcp_project_name = "DBT Data transformation"
  gcp_project_id   = "dbt-data-transformation"
}

module "gcp-project" {
  source           = "./gcp-project"
  gcp_project_id   = local.gcp_project_id
  gcp_project_name = local.gcp_project_name
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
}

## DBT

# module "dbt-project" {
#   source = "./dbt-project"
#   gcp_project_id = local.gcp_project_id
#   gcp_account_id = "70403103945172"
#   bigquery_dataset = module.bigquery-dataset.dataset_id
# }