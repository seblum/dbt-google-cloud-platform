locals {
  project_service_map = { for service in var.gcp_project_services : service => {} }
}

resource "google_project" "gcp_project" {
  name                = var.gcp_project_name
  project_id          = var.gcp_project_id
  auto_create_network = var.auto_create_network
  billing_account     = var.gcp_billing_account_id
  # org_id     = var.gcp_organization_id
}

resource "google_project_service" "project_services" {
  project            = google_project.gcp_project.project_id
  for_each           = local.project_service_map
  service            = each.key
  disable_on_destroy = false
}
