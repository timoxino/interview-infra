data "google_project" "project" {
}

resource "google_pubsub_topic" "default" {
  name = "extracted_skills_topic"
}

resource "google_service_account" "sa" {
  account_id   = "cloud-run-pubsub-invoker"
  display_name = "Cloud Run Pub/Sub Invoker"
}

resource "google_cloud_run_service_iam_binding" "binding" {
  location = "us-central1"
  service  = "sage"
  role     = "roles/run.invoker"
  members  = ["serviceAccount:${google_service_account.sa.email}"]
}

resource "google_project_service_identity" "pubsub_agent" {
  provider = google-beta
  project  = data.google_project.project.project_id
  service  = "pubsub.googleapis.com"
}

resource "google_project_iam_binding" "project_token_creator" {
  project = data.google_project.project.project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  members = ["serviceAccount:${google_project_service_identity.pubsub_agent.email}"]
}

resource "google_pubsub_subscription" "subscription" {
  name  = "sage_subscription"
  topic = google_pubsub_topic.default.name
}