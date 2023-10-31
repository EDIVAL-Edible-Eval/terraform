resource "google_artifact_registry_repository" "docker-repo" {
    location      = var.region
    repository_id = "edival-docker-repo"
    description   = "Edival Docker Repository"
    format        = "DOCKER"
}