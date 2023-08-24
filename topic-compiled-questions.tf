resource "google_cloud_run_service_iam_binding" "service_binding_toastmaster" {
  location = "us-central1"
  service  = "toastmaster"
  role     = "roles/run.invoker"
  members  = ["allUsers"]
}

resource "google_pubsub_topic" "topic_compiled_questions" {
  name = "compiled_questions_topic"
}

resource "google_pubsub_subscription" "subscription_toastmaster" {
  name  = "toastmaster_subscription"
  topic = google_pubsub_topic.topic_compiled_questions.name
}