terraform {
  backend "s3" {
    bucket = "arbaj-terraform-backend"
    key    = "backend/terraform"
    region = "us-east-1"
  }
}
