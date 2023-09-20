resource "google_cloud_run_service_iam_binding" "service_binding_tamer" {
  location = "us-central1"
  service  = google_cloud_run_service.service_tamer.name
  role     = "roles/run.invoker"
  members  = ["serviceAccount:${google_service_account.sa_cloud_run.email}"]
}

resource "google_pubsub_topic" "topic_pending_cv" {
  name = "pending_cv_topic"
}

resource "google_pubsub_subscription" "subscription_tamer" {
  name  = "tamer_subscription"
  topic = google_pubsub_topic.topic_pending_cv.name
}