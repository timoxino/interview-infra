resource "google_cloud_run_service" "service_sage" {
  name     = "sage"
  location = "us-central1"
  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/timoxino/interview/sage:latest"
      }
    }
  }
}

resource "google_cloud_run_service" "service_toastmaster" {
  name     = "toastmaster"
  location = "us-central1"
  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/timoxino/interview/toastmaster:latest"
      }
    }
  }
}

resource "google_cloud_run_service" "service_tamer" {
  name     = "tamer"
  location = "us-central1"
  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/timoxino/interview/tamer:latest"
      }
    }
  }
}