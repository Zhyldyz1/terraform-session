# resource "aws_sqs_queue" "count_queue" {
#   count = length(var.names)
#   name  = element(var.names, count.index)
# }

// This code block creates 3 aws sqs. The names are first, second, third
// 
// Problem statement: What is I have a map? (key values, dictionary)
// ASG on Amazon does not take  A MAP tag" 
// Until Terraform 0.13, we used element 

