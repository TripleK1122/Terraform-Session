resource "aws_instance" "main" {
      ami             = data.aws_ami.amazon_Linux_2023.id
    instance_type   = var.instance_type
    tags = {
        Name = "${var.env}-instance"
        Name2 = format("%s-instance",var.env)
        environment = var.env
    }
  vpc_security_group_ids = [aws_security_group.simple_sg.id]
  user_data = templatefile( "userdata.sh", { environment = var.env})
  }
  resource "aws_security_group" "simple_sg" {
  name        = "${var.env}- instance-sg"
  description = "This is a security group for hw2"
  }
  ############# SECURITY GROUP ##################
  resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  count = length(var.ingress_ports)
  security_group_id = aws_security_group.simple_sg.id
  cidr_ipv4         = element(var.ingress_cidr,count.index)
  from_port         = element(var.ingress_ports, count.index)
  ip_protocol       = "tcp"
  to_port           = element(var.ingress_ports, count.index)
}

# Syntax: element(list,index)
# element ([45,67,23,14,57,15,17],4)
# > 57
//22 , 80 ,  443
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.simple_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

