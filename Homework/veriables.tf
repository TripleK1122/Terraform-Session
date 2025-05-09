variable "instance_type" {
    description = "aws instance"
    type = string                                   
    default = "t2.micro"
}

variable "env" {
    description = "Environment"
    type = string
    default = "dev"
}