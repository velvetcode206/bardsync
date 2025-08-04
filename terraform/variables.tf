variable "gcp_project_id" {
  description = "Id of the GCP project"
  type        = string
  nullable    = false
}

variable "gcp_region" {
  description = "Region the GCP resources will be deployed"
  type        = string
  nullable    = false
}

variable "gcp_zone" {
  description = "Zone the GCP resources will be deployed"
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
