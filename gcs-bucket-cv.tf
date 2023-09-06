resource "google_storage_bucket" "gcs_bucket_cv" {
  name          = "interview-cv"
  location      = "US"
  project       = "timoxino"
}