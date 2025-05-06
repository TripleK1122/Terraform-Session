resource "aws_instance" "main" {
    ami             = "ami-058a8a5ab36292159" 
    instance_type   = var.instance_type
    tags = {
        Name = "${var.env}-instance" // dev-instance, qa-instance, stage-instance, prod-instance
        Name2 = format("%s-instance",var.env)
        Environment = var.env
    }
  vpc_security_group_ids = [aws_security_group.simple_sg.id]
}

// Reference to resource 
// Syntax: first_label.second_lavel.attribute
// Ex: aws_security_group.simple_sg

// Reference to Input Variable 
// Syntax: var .variable_name
// Ex : vpc_security_group_ids


resource "aws_security_group" "simple_sg" {
  name        = "simple_sg.v2"
  description = "This is a security group for hw2"

  ingress {
    from_port   = 22 // Number does not use ""
    to_port     = 22
    protocol    = "tcp"         // Everything inside "" string
    cidr_blocks = ["0.0.0.0/0"] // List of string 
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" //tcp,upd,icmp
    cidr_blocks = ["0.0.0.0/0"]
  }
}
