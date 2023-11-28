# enable API
resource "google_project_service" "notebooks" {
    provider           = google
    service            = "notebooks.googleapis.com"
    disable_on_destroy = false
}

# reference: https://github.com/terraform-google-modules/terraform-docs-samples/blob/main/vertex_ai/user_managed_notebooks_instance/main.tf
resource "google_notebooks_instance" "basic_instance" {
    name        = "edival-managed-notebooks"
    location    = var.zone
    machine_type = "c2-standard-8"

    vm_image {
        project      = "deeplearning-platform-release"
        image_family = "tf-ent-2-9-cu113-notebooks"
    }
}