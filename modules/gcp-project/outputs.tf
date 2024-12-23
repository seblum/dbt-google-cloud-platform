output "gcp_project_id" {
  description = "The GCP project ID"
  value       = google_project.gcp_project.project_id
}