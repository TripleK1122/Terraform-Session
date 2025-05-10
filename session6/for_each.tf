# resource "aws_sqs_queue" "for_each_queue" {
#     for_each = var,for_each_names
#     name = each.value
# }
# variable "for_each_names"  {
#     type = map
#     description = " a map of sqq names"
#     default = {
#         first = "first-for-each-sqs"
#         second = "second-for-each-sqs"
#         third = " third-for-each-sqs"
#     }
# }

resource "aws_sqs_queue" "for_each_queue" {
    for_each = toset( local.queue_names )
    name = each.key
}
locals {
  queue_names = [for i in range (1,3): "queue-${1}"]
}
// for_each meta argument works with both A MAP and A LIST