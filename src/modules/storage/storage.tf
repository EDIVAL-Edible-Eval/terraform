resource "google_storage_bucket" "storage-bucket" {
    name                        = "edival-402305-bucket"
    location                    = "ASIA"
    force_destroy               = true
    uniform_bucket_level_access = true
}