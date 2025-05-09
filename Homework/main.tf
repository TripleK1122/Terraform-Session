// create vpc 
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "main"
  }
}

// create 3's subnet - public 

resource "aws_subnet-pub" "sub1pub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2"
  tags = {
    Name = "pubsub1"
  }
}
resource "aws_subnet-pub" "sub2pub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2"
  tags = {
    Name = "pubsub2"
  }
}
resource "aws_subnet-pub" "sub3pub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2"
  tags = {
    Name = "pubsub3"
  }
}
// create 3's subnet - privet 

resource "aws_subnet-priv" "sub1priv" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2"
  tags = {
    Name = "privsub1"
  }
}
resource "aws_subnet-priv" "sub1priv" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2"
  tags = {
    Name = "privsub2"
  }
}
resource "aws_subnet-priv" "sub1priv" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2"
  tags = {
    Name = "privsub3"
  }
}
//create public rt to gateway

resource "aws_route_table_association" "roattable1" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.bar.id
}
resource "aws_route_table_association" "roattable2" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.bar.id
}
// Need finishing