output "project-id" {
  value = module.gcp-project.gcp_project_id
}

output "tf-state-bucket-name" {
  value = google_storage_bucket.terraform_state.name
}