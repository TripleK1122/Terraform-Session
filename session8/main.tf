resource "aws_key_pair" "main" {
  key_name   = "Terraform-Key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_security_group" "main" {
  name        = "main"
  description = "this is a security group for ec2"


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "main" {
  depends_on = [ null_resource.main ] // Explicit Dependency 
  ami                    = data.aws_ami.amazon_Linux_2023.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name               = aws_key_pair.main.id


  provisioner "file" {
    source      = "/Users/kostyakostin/Terraform/session8/index.html" // local path, The path where your file exist, local machine
    destination = "/tmp/index.html"                                   // remote path, The path where you send file to, remote machine 
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip
    private_key = file("~/.ssh/id_ed25519")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file("~/.ssh/id_ed25519")
    }
  }
}
resource "null_resource" "main" {
  provisioner "local-exec" {
    command = "echo 'Tersting Local Exec' > index.html"
  }
}