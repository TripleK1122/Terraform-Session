variable "instance_type" {
    description = "aws instance size or type"
    type = string // string, number, boolean, list(string),map list
    default = "t2.micro"
}

variable "env" {
    description = "Environmnet"
    type = string
    default = "dev"
}

variable "ingress_ports" {
    description = "a list of ingress ports"
    type = list(number)
    default = [ 22, 80 ]
  
}
variable "ingress_cidr" {
    description = "a list of ingress ports"
    type = list(string)
    default = [ "10.0.0.0/16", "0.0.0.0/0", "0.0.0.0/0", "10.0.0.0/16" ]
}
variable "public_subnets_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidrs" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
}

variable "availability_zones" {
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}
