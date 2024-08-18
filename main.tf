

## Bigquery



resource "google_bigquery_dataset" "dbt_quickstart_dataset" {
  dataset_id = var.bigquery_dataset_id
  location   = var.gcp_region
  project    = google_project.dbt_project.project_id
  ...
}

resource "google_service_account" "dbt_service_account" {
  account_id   = "dbt-cloud-sa"
  display_name = "dbt Cloud Service Account"
  project      = google_project.dbt_project.project_id
  ...
}

resource "google_project_iam_member" "dbt_service_account_role" {
  project = google_project.dbt_project.project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.dbt_service_account.email}"
}



resource "google_bigquery_dataset" "dbt_quickstart_dataset" {
  dataset_id = var.bigquery_dataset_id
  location   = var.gcp_region
  project    = var.gcp_project_id

  labels = {
    environment = "dev"
  }
}

resource "google_bigquery_table" "dbt_quickstart_table" {
  dataset_id = google_bigquery_dataset.dbt_quickstart_dataset.dataset_id
  table_id   = var.bigquery_table_id
  project    = var.gcp_project_id

  schema = jsonencode([
    {
      name = "id"
      type = "STRING"
      mode = "REQUIRED"
    },
    {
      name = "value"
      type = "FLOAT"
      mode = "NULLABLE"
    }
  ])
}

resource "google_service_account" "dbt_service_account" {
  account_id   = "dbt-cloud-sa"
  display_name = "dbt Cloud Service Account"
}

resource "google_project_iam_member" "dbt_service_account_role" {
  project = var.gcp_project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.dbt_service_account.email}"
}

resource "dbt_cloud_project" "dbt_project" {
  name = "dbt Quickstart Project"
}

resource "dbt_cloud_bigquery_connection" "dbt_connection" {
  project_id     = dbt_cloud_project.dbt_project.id
  connection_name = "BigQuery Connection"
  dataset        = google_bigquery_dataset.dbt_quickstart_dataset.dataset_id
  role           = google_service_account.dbt_service_account.email
  gcp_project_id = var.gcp_project_id
  timeout_seconds = 60

  private_key_id   = jsondecode(google_service_account_key.dbt_sa_key.private_key)["private_key_id"]
  private_key      = jsondecode(google_service_account_key.dbt_sa_key.private_key)["private_key"]
  client_email     = google_service_account.dbt_service_account.email
  client_id        = jsondecode(google_service_account_key.dbt_sa_key.private_key)["client_id"]
  client_x509_cert_url = jsondecode(google_service_account_key.dbt_sa_key.private_key)["client_x509_cert_url"]
}

resource "google_service_account_key" "dbt_sa_key" {
  service_account_id = google_service_account.dbt_service_account.name
}
