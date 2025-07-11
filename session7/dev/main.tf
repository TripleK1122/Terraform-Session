######### ROOT MODULE ##########
module "sg" {
  source = "../../moduls/sg" // Where the child module is. When you call child module locally, you use the path
############ VAriables ###########
    name = "dev-instance-sg"
    description = "this a sg for dev instance"
    ingress_ports = [22]
    ingress_cidr = ["10.0.0.0/32"]

}

module "ec2-inst" {
  source = "../../moduls/ec2"
  env = ""
  instance_type = "t2.micro"
  ami = data.aws_ami.amazon_Linux_2023.id // Reference to Data Source 
  vpc_security_group_ids = [module.sg.vpc_security_group_id] // Reference to Child Module Outputs // Styntax : module.module_name.output
  
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


####### Calling Terraform Modules Remotely #######
// Terraform Registry - Offical Child Module 
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "my-vpc"
  cidr = "10.0.0.0/16"
  azs = ["us-est-2a", "us-est-2b", "us-est-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24" ,"10.0.3.0/24"]
  public_subnets = ["10.0.102.0/24","10.0.102.0/24","10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

    tags = {
      Terraform = "true"
      Environment = "dev"
    }
}

module "erkin_sg" {
  source = "github.com/Ekanomics/terraform-session/modules/sg"
  name = "erkin-sg"
  description = "this a sg for dev instance"
  ingress_ports = [22]
  ingress_cidr = ["10.0.0.0/32"]
  
}

# github.com = source code management URL
# Ekanimics = user name 
# terraform-session = repository name 
# tree = 
# main = branch
# module = subdir
# sg = subdir