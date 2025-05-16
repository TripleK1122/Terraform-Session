resource "aws_sqs_queue" "main" {
    name = "${terraform.workspace}-sqs"
  
}

# terraform workspace show {current workspace}

# How to reference to workspace: terraform.workspace
# terraform.workspace = current workspace name 
