# enable API
resource "google_project_service" "notebooks" {
    provider           = google
    service            = "notebooks.googleapis.com"
    disable_on_destroy = false
}

# reference: https://github.com/terraform-google-modules/terraform-docs-samples/blob/main/vertex_ai/managed_notebooks_runtime/main.tf
resource "google_notebooks_runtime" "runtime" {
    name        = "edival-notebooks-runtime"
    location    = var.region
    access_config {
        access_type     = "SERVICE_ACCOUNT"
        runtime_owner   = "932830200046-compute@developer.gserviceaccount.com"
    }
    virtual_machine {
        virtual_machine_config {
        machine_type    = "n1-standard-4"
        data_disk {
            initialize_params {
            disk_size_gb    = "100"
            disk_type       = "PD_STANDARD"
            }
        }
        }
    }
}