terraform {
  backend "local" {
    path = "terraform.tfstate"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = "norse-decoder-387302"
  region  = "asia-southeast1"
}

resource "google_storage_bucket" "tf-remote-state" {
  name                     = "tf-remote-state-de-project"
  storage_class            = "STANDARD"
  location                 = "ASIA-SOUTHEAST1"
  public_access_prevention = "enforced"
  force_destroy            = true
}
