## Google compute router to route nat to subnetwork
resource "google_compute_router" "vpc-1-router" {
  name        = "vpc-1-router"
  description = "VPC 1 Router for Cloud NAT"
  network     = google_compute_network.vpc-1.id
}

resource "google_compute_address" "vpc-1-nat-address" {
  name         = "vpc-1-nat-address"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  depends_on   = [google_project_service.compute]
}

resource "google_compute_router_nat" "vpc-1-router-nat" {
  name   = "vpc-1-router-nat"
  router = google_compute_router.vpc-1-router.name

  # Set manual nat ip address
  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips                = [google_compute_address.vpc-1-nat-address.self_link]

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.vpc-1-private-subnet-1.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

