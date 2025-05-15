# resource "aws_sqs_queue" "for_each_queue" {
#     for_each = var.for_each_names
#     name     = each.value
   
# }

resource "aws_sqs_queue" "for_each_queue" {
    for_each = toset(local.queue_names)
    name     = each.key
}
// FOR EXPRESSION


# locals {
#     queue_names = [ for i in range (1, 3): "queque-$(i)"]
# }

// For_each meta argument works with both A MAP and A LIST
# AWS


