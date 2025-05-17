resource "aws_instance" "main" {
      ami             = data.aws_ami.amazon_Linux_2023.id
    instance_type   = "t2.micro"
    tags = {
        Name = "session9-instance"
        environment = var.env
        engineer = "1"
        engineer = "2"

    }
  }

variable "env" {
    type = string
    description = "enveironment"
    default = "qa"
}
data "aws_ami" "amazon_Linux_2023" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.7.*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_sqs_queue" "main" {
  name = "session-9-sqs"
}

