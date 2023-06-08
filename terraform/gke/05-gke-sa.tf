locals {
  k8s-namespace = "airflow"
  k8s-sa        = "sa-gke"
}

resource "google_service_account" "google-sa-gke" {
  account_id = "google-sa-gke"

}

resource "google_project_iam_member" "google-sa-gke" {
  project = var.project_name
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.google-sa-gke.email}"
}

resource "google_service_account_iam_member" "google-sa-gke" {
  service_account_id = google_service_account.google-sa-gke.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_name}.svc.id.goog[${local.k8s-namespace}/${local.k8s-sa}]"
}

resource "kubernetes_namespace" "ns-airflow" {
  metadata {
    name = "airflow"
  }
  depends_on = [google_container_cluster.primary]
}

resource "kubernetes_service_account" "k8s-sa-gke" {
  metadata {
    name      = "sa-gke"
    namespace = "airflow"
    annotations = {
      "iam.gke.io/gcp-service-account" = google_service_account.google-sa-gke.email
    }
  }

  depends_on = [google_service_account.google-sa-gke, google_service_account.google-sa-gke]

}
