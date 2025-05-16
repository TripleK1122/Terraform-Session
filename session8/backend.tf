terraform {
  backend "s3" {
    bucket  = "terraform-session-backend-bucket-kostya"
    key     = "session 8/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}