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

# # Bind IAM role to OIDC identities
# resource "google_iam_policy_binding" "oidc_role_binding" {
#   project                            = module.gcp-project.gcp_project_id
#   role    = "roles/iam.serviceAccountTokenCreator"  # Example role for accessing a service account's token

#   members = [
#     "principalSet://iam.googleapis.com/projects/${local.gcp_project_id}/locations/global/workloadIdentityPools/shared-github-oidc/attribute.repository/seblum/port",
#   ]
# }

resource "google_service_account" "port_service_account" {
  account_id   = "port-integration"
  display_name = "port-integration"
}

# resource "google_project_iam_member" "token_creator_for_sa" {
#   project = module.gcp-project.gcp_project_id
#   role    = "roles/iam.serviceAccountTokenCreator"

#   member = "serviceAccount:port-integration@${module.gcp-project.gcp_project_id}.iam.gserviceaccount.com" # The service account which will impersonate

# }

resource "google_service_account_iam_binding" "oidc-wi-user-role" {
  service_account_id = google_service_account.port_service_account.name
  role               = "roles/iam.workloadIdentityUser"
  members = [
    "principalSet://iam.googleapis.com/projects/31482509155/locations/global/workloadIdentityPools/shared-oidc-pool/attribute.repository/seblum/port"
  ]
}

resource "google_service_account_iam_binding" "oidc-sa-token-role" {
  service_account_id = google_service_account.port_service_account.name
  role               = "roles/iam.serviceAccountTokenCreator"
  members = [
    "principalSet://iam.googleapis.com/projects/31482509155/locations/global/workloadIdentityPools/shared-oidc-pool/attribute.repository/seblum/port"
  ]
}