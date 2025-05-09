// create a vpc

resource "aws_vpc" "app-vpc1" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "terraform-vpc1"
    }
}

// create a public subnet 3s

resource "aws_subnet" "app-public-subnet-1" {
    vpc_id = aws_vpc.app-vpc1.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-2a"
}

resource "aws_subnet" "app-public-subnet-2" {
    vpc_id = aws_vpc.app-vpc1.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-2b"
}

resource "aws_subnet" "app-public-subnet-3" {
    vpc_id = aws_vpc.app-vpc1.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-2c"
}

// create a private subnet 3s 

resource "aws_subnet" "app-private-subnet-1" {
    vpc_id = aws_vpc.app-vpc1.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-east-2a"
}

resource "aws_subnet" "app-private-subnet-2" {
    vpc_id = aws_vpc.app-vpc1.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "us-east-2b"
}

resource "aws_subnet" "app-private-subnet-3" {
    vpc_id = aws_vpc.app-vpc1.id
    cidr_block = "10.0.5.0/24"
    availability_zone = "us-east-2c"
}

// create IGW

resource "aws_internet_gateway" "app-igw1" {
    vpc_id = aws_vpc.app-vpc1.id
}

// create public route table 

resource "aws_route_table" "app-public-rt1" {
    vpc_id = aws_vpc.app-vpc1.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.app-igw1.id
    }
}

// create private route table 

resource "aws_route_table" "app-private-rt1" {
    vpc_id = aws_vpc.app-vpc1.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.app-natgateway1.id
    }
}
// associate public subnets with a public route table

resource "aws_route_table_association" "public-rt1-association-sub-1" {
    subnet_id = aws_subnet.app-public-subnet-1.id
    route_table_id = aws_route_table.app-public-rt1.id
}

resource "aws_route_table_association" "public-rt1-association-sub-2" {
    subnet_id = aws_subnet.app-public-subnet-2.id
    route_table_id = aws_route_table.app-public-rt1.id
}

resource "aws_route_table_association" "public-rt1-association-sub-3" {
    subnet_id = aws_subnet.app-public-subnet-3.id
    route_table_id = aws_route_table.app-public-rt1.id
}

// associate private subnets with a private route table 

resource "aws_route_table_association" "private-rt1-association-sub-1" {
    subnet_id = aws_subnet.app-private-subnet-1.id
    route_table_id = aws_route_table.app-private-rt1.id
}

resource "aws_route_table_association" "private-rt1-association-sub-2" {
    subnet_id = aws_subnet.app-private-subnet-2.id
    route_table_id = aws_route_table.app-private-rt1.id
}

resource "aws_route_table_association" "private-rt1-association-sub-3" {
    subnet_id = aws_subnet.app-private-subnet-3.id
    route_table_id = aws_route_table.app-private-rt1.id
}

//  Elastic IP

resource "aws_eip" "elastic-ip" {
    domain = "vpc" 
}
// NAT Gateway

resource "aws_nat_gateway" "app-natgateway1" {
    allocation_id = aws_eip.elastic-ip.id
    subnet_id = aws_subnet.app-public-subnet-1.id
}

// create EC2 Instance

resource "aws_instance" "app_ec2" {
  ami           = "ami-058a8a5ab36292159"       # argument 
  instance_type = var.instance_type
  subnet_id = aws_subnet.app-public-subnet-1.id
  tags = {
    Name = "${var.env}-instance"      // dev-instance, qa-instance, prod-instance
    Environment = var.env
  }
  vpc_security_group_ids = [aws_security_group.app_ec2.id] // anything dynamic goes wihtout ""
}

// create a security group 

resource "aws_security_group" "app_ec2" {
  
  name = "session3-homework-sg"
  description = "this is a sg for hw"
  vpc_id = aws_vpc.app-vpc1.id
  
  ingress {
    from_port        = 80         
    to_port          = 80
    protocol         = "tcp"        // everything inside "" is a string 
    cidr_blocks      = ["0.0.0.0/0"]  // list of string 
    

  }
  ingress {
    from_port        = 22          
    to_port          = 22
    protocol         = "tcp"        
    cidr_blocks      = ["0.0.0.0/0"]   
    

  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"     //tcp, udp, icmp
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
}