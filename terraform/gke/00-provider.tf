terraform {
  backend "gcs" {
    bucket = "tf-remote-state-de-project"
    prefix = "terraform/state/gke"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_name
  region  = var.region
}
