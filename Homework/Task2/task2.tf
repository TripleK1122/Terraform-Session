provider "aws" {
  region = "us-east-2" # Your region
}

resource "aws_instance" "home-taskweb" {
  ami           = "ami-058a8a5ab36292159"
  instance_type = "t2.micro"
  tags = {
    Name        = "My home-work for session 2"
    Environment = "dev"
  }
}
resource "aws_security_group" "simple_sg" {
  name        = "simple_sg"
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
