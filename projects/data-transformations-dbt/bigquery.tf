
## Bigquery

module "bigquery-dataset" {
  source           = "../../modules/bigquery"
  project_id       = module.gcp-project.gcp_project_id
  bigquery_configs = yamldecode(file("./bigquery_configs.yaml"))
}
