# GKE NODES

resource "google_service_account" "gke_nodes" {
  account_id   = var.gcp_sa_gke_nodes_id
  display_name = var.gcp_sa_gke_nodes_name
}

resource "google_project_iam_member" "gke_nodes_default" {
  project = var.gcp_project_id
  role    = "roles/container.defaultNodeServiceAccount"
  member  = "serviceAccount:${google_service_account.gke_nodes.email}"
}

resource "google_project_iam_member" "gke_nodes_logging" {
  project = var.gcp_project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.gke_nodes.email}"
}

resource "google_project_iam_member" "gke_nodes_monitoring" {
  project = var.gcp_project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.gke_nodes.email}"
}

# GKE NODE PODS

resource "google_service_account" "gke_node_pods" {
  account_id   = var.gcp_sa_gke_node_pods_id
  display_name = var.gcp_sa_gke_node_pods_name
}

resource "google_project_iam_member" "gke_node_pods_pubsub" {
  project = var.gcp_project_id
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:${google_service_account.gke_node_pods.email}"
}

# WORKLOAD IDENTITY FOR GKE

resource "google_service_account_iam_member" "gke_binding_development" {
  service_account_id = google_service_account.gke_node_pods.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.gcp_project_id}.svc.id.goog[${var.ksa_namespace_dev}/${var.gcp_sa_ksa_name}]"
}

resource "google_service_account_iam_member" "gke_binding_production" {
  service_account_id = google_service_account.gke_node_pods.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.gcp_project_id}.svc.id.goog[${var.ksa_namespace_prd}/${var.gcp_sa_ksa_name}]"
}

# WORKLOAD IDENTITY FEDERATION - GITHUB ACTIONS

resource "google_iam_workload_identity_pool" "github_actions" {
  workload_identity_pool_id = var.gcp_identy_pool_github_actions_id
  display_name              = "GitHub Actions Pool"
  description               = "OIDC pool for GitHub Actions"
  disabled                  = false
}

resource "google_iam_workload_identity_pool_provider" "github_actions" {
  workload_identity_pool_id = google_iam_workload_identity_pool.github_actions.workload_identity_pool_id
  workload_identity_pool_provider_id = "github"
  display_name = "GitHub Provider"
  description  = "OIDC provider for GitHub Actions"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }

  attribute_condition = "attribute.repository == '${var.repository_path}'"

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account" "sa_github_actions" {
  account_id   = var.gcp_sa_github_actions_id
  display_name = var.gcp_sa_github_actions_name
}

resource "google_project_iam_member" "artifact_registry_writer" {
  project = var.gcp_project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.sa_github_actions.email}"
}

resource "google_service_account_iam_member" "workload_identity_github_actions" {
  service_account_id = google_service_account.sa_github_actions.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_actions.name}/attribute.repository/${var.repository_path}"
}
