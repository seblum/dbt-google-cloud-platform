output "project_id" {
  value = google_project.dbt_project.project_id
}

output "project_name" {
  value = google_project.dbt_project.name
}



# bigquery



output "bigquery_dataset_id" {
  value = google_bigquery_dataset.dbt_quickstart_dataset.dataset_id
}

output "bigquery_table_id" {
  value = google_bigquery_table.dbt_quickstart_table.table_id
}

output "dbt_project_id" {
  value = dbt_cloud_project.dbt_project.id
}

output "dbt_connection_id" {
  value = dbt_cloud_bigquery_connection.dbt_connection.id
}
