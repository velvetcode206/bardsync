resource "google_service_account" "gke_node" {
  account_id   = var.gcp_gke_node_sa_id
  display_name = var.gcp_gke_node_sa_name
}

resource "google_project_iam_member" "gke_node_sa_default" {
  project = var.gcp_project_id
  role    = "roles/container.defaultNodeServiceAccount"
  member  = "serviceAccount:${google_service_account.gke_node.email}"
}

resource "google_project_iam_member" "gke_node_sa_logging" {
  project = var.gcp_project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.gke_node.email}"
}

resource "google_project_iam_member" "gke_node_sa_monitoring" {
  project = var.gcp_project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.gke_node.email}"
}

resource "google_service_account" "gke_node_pod" {
  account_id   = var.gcp_gke_node_pod_sa_id
  display_name = var.gcp_gke_node_pod_sa_name
}

resource "google_project_iam_member" "gke_node_pod_sa_pubsub" {
  project = var.gcp_project_id
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:${google_service_account.gke_node_pod.email}"
}

resource "google_service_account_iam_member" "workload_identity_binding_development" {
  service_account_id = google_service_account.gke_node_pod.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.gcp_project_id}.svc.id.goog[${var.ksa_namespace_development}/${var.gcp_ksa_sa_name}]"
}

resource "google_service_account_iam_member" "workload_identity_binding_production" {
  service_account_id = google_service_account.gke_node_pod.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.gcp_project_id}.svc.id.goog[${var.ksa_namespace_production}/${var.gcp_ksa_sa_name}]"
}