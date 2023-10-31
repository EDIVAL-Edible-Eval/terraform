terraform {
    backend "gcs" {
        bucket  = "edival-terraform-tfstate"
        prefix  = "terraform/state"
    }
    required_providers {
        google = {
            source  = "hashicorp/google"
            version = "4.53.0"
        }
    }
}

provider "google" {
    project     = var.project_id
    region      = var.region
    zone        = var.zone
}

module "artifact-registry" {
    source = "./modules/artifact-registry"
}

module "cloud-run" {
    source      = "./modules/cloud-run"
}

module "storage" {
    source      = "./modules/storage"
}