output "gcp_project_id_and_number" {
  description = "GCloud Project ID & Number"
  value       = "${var.gcp_project_id} / ${var.gcp_project_number}"
}

output "gcp_region_and_zone" {
  description = "GCloud Region & Zone"
  value       = "${var.gcp_region} / ${var.gcp_region}"
}

output "gcp_global_address_gke_gateway" {
  description = "GCloud GKE Gateway API"
  value       = "Gateway IP: ${google_compute_global_address.gke_gateway.address}"
}

output "gcp_sa_gke_nodes" {
  description = "GCloud Service Account for GKE Nodes"
  value       = "${google_service_account.gke_nodes.email} / ${google_service_account.gke_nodes.member}"
}

output "gcp_sa_gke_node_pods" {
  description = "GCloud Service Account for GKE Node Pods"
  value       = "${google_service_account.gke_node_pods.email} / ${google_service_account.gke_node_pods.member}"
}

output "gcp_sa_github_actions" {
  description = "GCloud Service Account for Github Actions"
  value       = "${google_service_account.sa_github_actions.email} / ${google_service_account.sa_github_actions.member}"
}

output "github_workload_identity_provider" {
  value = "projects/${var.gcp_project_number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.github_actions.workload_identity_pool_id}/providers/${google_iam_workload_identity_pool_provider.github_actions.workload_identity_pool_provider_id}"
}

output "artifact_repository_client" {
  description = "GCloud Artifact Repository for the client app"
  value       = "${google_artifact_registry_repository.client.name} / ${google_artifact_registry_repository.client.location}"
}

output "kubernetes_cluster_name" {
  description = "GCloud GKE Cluster Name"
  value       = google_container_cluster.primary.name
}

output "kubernetes_cluster_host" {
  description = "GCloud GKE Cluster Host"
  value       = google_container_cluster.primary.endpoint
}
