resource "google_cloud_run_service_iam_binding" "binding" {
  location = "us-central1"
  service  = "toastmaster"
  role     = "roles/run.invoker"
  members  = ["allUsers"]
}

resource "google_pubsub_topic" "default" {
  name = "compiled_questions_topic"
}

resource "google_pubsub_subscription" "subscription" {
  name  = "toastmaster_subscription"
  topic = google_pubsub_topic.default.name
}