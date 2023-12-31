# Enables the Cloud Run API
resource "google_project_service" "run_api" {
    service = "run.googleapis.com"
    disable_on_destroy = true
}

# Create the Cloud Run service
resource "google_cloud_run_service" "run_service" {
    name = "edival-api"
    location = var.region
    template {
        spec {
            containers {
                image = "us-central1-docker.pkg.dev/edival-402305/edival-docker-repo/edival-api-image:tag2"
            }
        }
    }
    traffic {
        percent         = 100
        latest_revision = true
    }
    # Waits for the Cloud Run API to be enabled
    depends_on = [google_project_service.run_api]
}

# Allow unauthenticated users to invoke the service
resource "google_cloud_run_service_iam_member" "run_all_users" {
    service  = google_cloud_run_service.run_service.name
    location = google_cloud_run_service.run_service.location
    role     = "roles/run.invoker"
    member   = "allUsers"
}