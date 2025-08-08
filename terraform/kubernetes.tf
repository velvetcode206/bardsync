resource "google_container_cluster" "primary" {
  name       = var.gcp_gke_cluster_name
  location   = var.gcp_zone
  network    = google_compute_network.primary.name
  subnetwork = google_compute_subnetwork.primary.name
  
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  gateway_api_config {
    channel = "CHANNEL_STANDARD"
  }

  workload_identity_config {
    workload_pool = "${var.gcp_project_id}.svc.id.goog"
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.gcp_gke_node_pool_name
  location   = var.gcp_zone
  cluster    = google_container_cluster.primary.name

  autoscaling {
    min_node_count = 1
    max_node_count = 1
  }

  node_config {
    spot = true
    machine_type = "e2-medium"
    disk_type    = "pd-standard"
    disk_size_gb = 20
    service_account = google_service_account.gke_nodes.email

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
