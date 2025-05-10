resource "aws_sqs_queue" "count_queue" {
    count = length(var.names)
    name = element(var.names , count.index)
}
variable "names"  {
    type = list(string)
    description = "a list aws sqs names"
    default = [ "firs", "second", "third" ]
}

// This code block creates 3 aws sqs. The names are first, second, third 
// element function is limited to A LIST 
// Until Terraform 0.13 , we used element
// Problem statement: What if I have A MAP
