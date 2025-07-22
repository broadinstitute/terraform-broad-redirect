terraform {
  backend "gcs" {
    bucket = "broad-atlantis-terraform-prod"
    prefix = "broad-redirect/prod"
  }
}
