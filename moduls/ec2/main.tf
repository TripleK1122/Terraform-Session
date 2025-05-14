resource "aws_instance" "main" {
      ami             = var.ami
    instance_type   = var.instance_type
    tags = {
        Name = "${var.env}-instance"
        Name2 = format("%s-instance",var.env)
        environment = var.env
    }
  vpc_security_group_ids = var.vpc_security_group_ids
  }
