terraform {
  backend "s3" {
    bucket = "arbaj-terraform-backend"
    key    = "backend/jenkins"
    region = "us-east-1"
  }
}
