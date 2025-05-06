variable "instance_type" {
    description = "aws instance size or type"
    type = string // string, number, boolean, list(string),map list
    default = "t2.micro"
}

variable "env" {
    description = "Environmnet"
    type = string
    default = "qa"
}