output "aws_instance_public_ip" {
  value = aws_instance.main.public_ip
  description = "AWS EC2 Instance Public IP Adress"
}