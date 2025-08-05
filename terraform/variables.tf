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

variable "gcp_gke_node_sa_id" {
  type        = string
  nullable    = false
}

variable "gcp_gke_node_sa_name" {
  type        = string
  nullable    = false
}

variable "gcp_gke_node_pod_sa_id" {
  type        = string
  nullable    = false
}

variable "gcp_gke_node_pod_sa_name" {
  type        = string
  nullable    = false
}

variable "gcp_ksa_sa_name" {
  type        = string
  nullable    = false
}

variable "ksa_namespace_production" {
  type        = string
  nullable    = false
}

variable "ksa_namespace_development" {
  type        = string
  nullable    = false
}
