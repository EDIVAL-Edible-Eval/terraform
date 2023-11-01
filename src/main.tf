terraform {
    backend "gcs" {
        bucket  = "edival-402305-bucket"
        prefix  = "terraform/state"
    }
    # backend "local" {
    #     path = "./terraform.tfstate"
    # }
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
    source      = "./modules/artifact-registry"
}

module "cloud-run" {
    source      = "./modules/cloud-run"
}

module "storage" {
    source      = "./modules/storage"
}

module "vertexai-notebook" {
    source      = "./modules/vertexai-notebook"
}