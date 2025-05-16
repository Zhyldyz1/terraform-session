resource "aws_sqs_queue" "main" {
  name = "${terraform.workspace}-sqs"
}

# terraform workspace show (current workspace)
# How to reference to workspace: terraform.workspacheck 
#   terraform.workspace = current workspace name 

# In s3 bucket, out tf.state is going to look like 
# workspaces/dev/terraform.tfstate