resource "google_artifact_registry_repository" "client" {
  repository_id = var.gcp_artifact_repo_client_id
  description   = var.gcp_artifact_repo_client_description
  format        = var.gcp_artifact_repo_client_format
  location      = var.gcp_region
}
