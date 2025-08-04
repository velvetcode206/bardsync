output "region" {
  description = "GCloud Region"
  value       = var.gcp_region
}

output "project_id" {
  description = "GCloud Project ID"
  value       = var.gcp_project_id
}

output "kubernetes_cluster_name" {
  description = "GKE Cluster Name"
  value       = google_container_cluster.primary.name
}

output "kubernetes_cluster_host" {
  description = "GKE Cluster Host"
  value       = google_container_cluster.primary.endpoint
}
