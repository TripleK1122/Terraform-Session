terraform {
  backend "s3" {
    bucket  = "terraform-session-backend-bucket-kostya"
    key     = "workspace.tfstate"
    region  = "us-east-2"
    encrypt = true
    workspace_key_prefix = "workspaces"
  }
}

# Each workspace will have its own terraform.tfstate file

# In S3 Bucket

# Syntax: workspace_key_prefix/workspace.name/key
# Example : workspace/dev/terraform.tfstate

