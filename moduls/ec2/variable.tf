variable "instance_type" {
    description = "aws indtance size or type"
    type = string // string 
    default = "t2.micro"
}

variable "env" {
  description = "environment"
  type = string
  default = "dev"
}

variable "ami" {
  description = "AMI id"
  type = string
  default = "xyz"
}
variable "vpc_security_group_ids" {
  description = "security group ids"
  type = list(string)
  default = ["xyz"]
}
