# Create Workload Identity Pool
resource "google_iam_workload_identity_pool" "oidc_wi_pool" {
  project                   = module.gcp-project.gcp_project_id
  workload_identity_pool_id = "shared-oidc-pool" # Unique name for the Workload Identity Pool
  display_name              = "Shared OIDC WIP"
}

# Create OIDC Provider for the Workload Identity Pool
resource "google_iam_workload_identity_pool_provider" "github_actions_oidc_provider" {
  project                            = module.gcp-project.gcp_project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.oidc_wi_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "shared-github-oidc" # Unique name for the OIDC provider
  display_name                       = "Shared Github OIDC Provider"

  attribute_mapping = {
    "attribute.aud"        = "assertion.aud"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
    "google.subject"       = "assertion.sub"

  }
  attribute_condition = "attribute.repository == 'seblum/port'"

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com" # The OIDC issuer URI (e.g., external identity provider URL)
  }
}

resource "google_service_account" "port_service_account" {
  account_id   = "port-integration"
  display_name = "port-integration"
}

resource "google_service_account_iam_binding" "oidc-wi-user-role" {
  service_account_id = google_service_account.port_service_account.name
  role               = "roles/iam.workloadIdentityUser"
  members            = [var.oidc_provider_principalSet]
}

resource "google_service_account_iam_binding" "oidc-sa-token-role" {
  service_account_id = google_service_account.port_service_account.name
  role               = "roles/iam.serviceAccountTokenCreator"
  members            = [var.oidc_provider_principalSet]
}