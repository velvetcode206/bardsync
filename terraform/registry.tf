resource "google_artifact_registry_repository" "client-repo" {
  location      = var.gcp_region
  repository_id = var.gcp_artifact_repo_client
  description   = "Repository for the images of the client app"
  format        = "DOCKER"
}