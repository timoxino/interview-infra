resource "google_cloud_run_service" "service_sage" {
  name     = "sage"
  location = "us-central1"
}

resource "google_cloud_run_service" "service_toastmaster" {
  name     = "toastmaster"
  location = "us-central1"
}

resource "google_cloud_run_service" "service_tamer" {
  name     = "tamer"
  location = "us-central1"
}