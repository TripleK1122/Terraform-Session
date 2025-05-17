terraform {
  backend "s3" {
    bucket  = "terraform-session-backend-bucket-kostya"
    key     = "session 9/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
    dynamodb_table = "terraform-state-locking"
  }
}