resource "google_cloud_run_service_iam_binding" "binding" {
  location = "us-central1"
  service  = "sage"
  role     = "roles/run.invoker"
  members  = ["allUsers"]
}

resource "google_pubsub_topic" "default" {
  name = "extracted_skills_topic"
}

resource "google_pubsub_subscription" "subscription" {
  name  = "sage_subscription"
  topic = google_pubsub_topic.default.name
}