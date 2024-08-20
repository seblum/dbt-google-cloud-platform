
locals {
  bigquery_table_list = flatten([
    for dataset_name, config in var.bigquery_configs : [
      for table_name, table_config in config.tables : {
        table_key = "${dataset_name}-${table_name}"
        dataset_id = config.dataset.dataset_id
        table_id   = table_config.table_id
        schema     = table_config.schema
      }
    ]
  ])
  bigquery_tables = { for table in local.bigquery_table_list : table.table_key => table }
}

resource "google_bigquery_dataset" "bq_dataset" {
  for_each = var.bigquery_configs

  dataset_id = each.value.dataset.dataset_id
  location   = each.value.dataset.location
  project    = var.project_id

  labels = {
    environment = "dev"
  }
}

resource "google_bigquery_table" "bq_table" {
  for_each = local.bigquery_tables

  dataset_id = each.value.dataset_id
  table_id   = each.value.table_id
  project    = var.project_id

  schema = jsonencode(each.value.schema)
}