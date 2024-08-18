resource "google_project" "dbt_project" {
  name       = var.project_name
  project_id = var.gcp_project_id
  org_id     = var.organization_id
  billing_account = var.billing_account_id

  folder_id = var.folder_id # Optional, only if you are organizing projects in folders
}

resource "google_project_service" "project_services" {
  project = google_project.dbt_project.project_id
  for_each = toset([
    "bigquery.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com",
  ])
  service = each.key
  disable_on_destroy = false
}
