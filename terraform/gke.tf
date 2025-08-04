resource "google_service_account" "gke_nodes" {
  account_id   = var.gcp_gke_node_sa_id
  display_name = var.gcp_gke_node_sa_name
}

resource "google_project_iam_member" "gke_node_sa_roles" {
  project = var.gcp_project_id
  role    = "roles/container.defaultNodeServiceAccount"
  member  = "serviceAccount:${google_service_account.gke_nodes.email}"
}

resource "google_container_cluster" "primary" {
  name       = "${var.gcp_project_id}-cluster"
  location   = var.gcp_zone
  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
  
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "${var.gcp_project_id}-node-pool"
  location   = var.gcp_zone
  cluster    = google_container_cluster.primary.name

  autoscaling {
    min_node_count = 1
    max_node_count = 1
  }

  node_config {
    spot = true
    machine_type = "e2-micro"
    disk_type    = "pd-standard"
    disk_size_gb = 10

    oauth_scopes = [ 
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
