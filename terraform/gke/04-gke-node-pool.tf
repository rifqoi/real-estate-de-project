resource "google_service_account" "kubernetes-node" {
  account_id = "kubernetes-node"
}

resource "google_container_node_pool" "primary-node-pool" {
  cluster     = google_container_cluster.primary.id
  node_count  = 1
  name_prefix = "gke-node-"

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }

  node_config {
    machine_type = "e2-standard-2"
    preemptible  = false
    disk_size_gb = 30

    labels = {
      role = "node-general"
    }
    service_account = google_service_account.kubernetes-node.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
