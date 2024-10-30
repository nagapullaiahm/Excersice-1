resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  initial_node_count = 1  # Initial node for the control plane

  remove_default_node_pool = true
  node_locations           = [var.region]

  # Define primary node pool (fixed size)
  node_pool {
    name       = "primary-pool"
    node_count = 2

    node_config {
      machine_type = "e2-medium"
      oauth_scopes = [
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
      ]
    }

    management {
      auto_upgrade = true
      auto_repair  = true
    }
  }

  # Define second node pool with auto-scaling
  node_pool {
    name       = "autoscale-pool"
    initial_node_count = 1

    autoscaling {
      min_node_count = 1
      max_node_count = 5
    }

    node_config {
      machine_type = "e2-medium"
      oauth_scopes = [
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
      ]
    }

    management {
      auto_upgrade = true
      auto_repair  = true
    }
  }
}
