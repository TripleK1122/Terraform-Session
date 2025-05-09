terraform {
  backend "s3" {
    bucket         = "terraform-session-backend-bucket-kostya"
    key            = "session4/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
  }
}