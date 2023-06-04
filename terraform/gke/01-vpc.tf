resource "google_project_service" "compute" {
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
}

resource "google_compute_network" "vpc-1" {
  name                            = "vpc-1"
  routing_mode                    = "REGIONAL"
  mtu                             = 1460
  auto_create_subnetworks         = false
  delete_default_routes_on_create = false

  depends_on = [
    google_project_service.compute,
    google_project_service.container
  ]
}

resource "google_compute_subnetwork" "vpc-1-private-subnet-1" {
  name                     = "vpc-1-private-subnet-1"
  network                  = google_compute_network.vpc-1.id
  region                   = var.region
  private_ip_google_access = true
  ip_cidr_range            = "10.0.0.0/16"

  secondary_ip_range {
    range_name    = "gke-pods-range"
    ip_cidr_range = "10.48.0.0/16"
  }

  secondary_ip_range {
    range_name    = "gke-service-range"
    ip_cidr_range = "10.52.0.0/20"
  }

}

