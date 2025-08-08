resource "google_compute_network" "primary" {
  name                    = var.gcp_network_primary_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "primary" {
  name          = var.gcp_subnet_primary_name
  region        = var.gcp_region
  ip_cidr_range = var.gcp_subnet_primary_range
  network       = google_compute_network.primary.name
}

resource "google_compute_global_address" "gke_gateway" {
  name = var.gcp_global_address_gke_gateway_name
}
