resource "google_storage_bucket" "storage-bucket" {
    name                        = "edival-terraform-tfstate"
    location                    = "ASIA"
    force_destroy               = true
    uniform_bucket_level_access = true
}