resource "google_container_cluster" "primary" {
  name = "primary"

  # Set the cluster to be a zonal cluster, not ranging to all az
  location                 = var.zone
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.vpc-1.self_link
  subnetwork               = google_compute_subnetwork.vpc-1-private-subnet-1.self_link
  networking_mode          = "VPC_NATIVE"

  node_locations = var.gke-nodes-zone

  addons_config {
    http_load_balancing {
      disabled = false
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "gke-pods-range"
    services_secondary_range_name = "gke-service-range"
  }

  workload_identity_config {
    workload_pool = "${var.project_name}.svc.id.goog"
  }

  release_channel {
    channel = "REGULAR"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
}


