# REPOSITORY
variable "repository_path" {
  type        = string
  nullable    = false
}

# GCP PROJECT

variable "gcp_project_number" {
  type        = string
  nullable    = false
}

variable "gcp_project_id" {
  type        = string
  nullable    = false
}

variable "gcp_region" {
  type        = string
  nullable    = false
}

variable "gcp_zone" {
  type        = string
  nullable    = false
}

# NETWORKING

variable "gcp_network_primary_name" {
  type        = string
  nullable    = false
}

variable "gcp_subnet_primary_name" {
  type        = string
  nullable    = false
}

variable "gcp_subnet_primary_range" {
  type        = string
  nullable    = false
}

variable "gcp_global_address_gke_gateway_ip_name" {
  type        = string
  nullable    = false
}

# ARTIFACT REGISTRY

variable "gcp_artifact_repo_format" {
  type        = string
  nullable    = false
}

variable "gcp_artifact_repo_client_id" {
  type        = string
  nullable    = false
}

variable "gcp_artifact_repo_client_description" {
  type        = string
  nullable    = false
}

variable "gcp_artifact_repo_service_auth_id" {
  type        = string
  nullable    = false
}

variable "gcp_artifact_repo_service_auth_description" {
  type        = string
  nullable    = false
}


# KUBERNETES

variable "gcp_gke_cluster_name" {
  type        = string
  nullable    = false
}

variable "gcp_gke_node_pool_name" {
  type        = string
  nullable    = false
}

variable "ksa_namespace_prd" {
  type        = string
  nullable    = false
}

variable "ksa_namespace_dev" {
  type        = string
  nullable    = false
}

# SERVICE ACCOUNTS

variable "gcp_sa_gke_nodes_id" {
  type        = string
  nullable    = false
}

variable "gcp_sa_gke_nodes_name" {
  type        = string
  nullable    = false
}

variable "gcp_sa_gke_node_pods_id" {
  type        = string
  nullable    = false
}

variable "gcp_sa_gke_node_pods_name" {
  type        = string
  nullable    = false
}

variable "gcp_sa_github_actions_id" {
  type        = string
  nullable    = false
}

variable "gcp_sa_github_actions_name" {
  type        = string
  nullable    = false
}

variable "gcp_sa_ksa_name" {
  type        = string
  nullable    = false
}

# WORKLOAD IDENTITY

variable "gcp_identy_pool_github_actions_id" {
  type        = string
  nullable    = false
}
