resource "google_cloud_run_service_iam_binding" "service_binding_sage" {
  location = "us-central1"
  service  = "sage"
  role     = "roles/run.invoker"
  members  = ["allUsers"]
}

resource "google_pubsub_topic" "topic_extracted_skills" {
  name = "extracted_skills_topic"
}

resource "google_pubsub_subscription" "subscription_sage" {
  name  = "sage_subscription"
  topic = google_pubsub_topic.topic_extracted_skills.name
}