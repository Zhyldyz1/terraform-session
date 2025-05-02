resource "aws_instance" "first_ec2" {
  ami           = "ami-0f88e80871fd81e91"
  instance_type = "t2.micro"
  tags = {
    Name        = "aws-session2-instance"
    Environment = "dev"
  }
}

resource "aws_instance" "second_ec2" {
  ami           = "ami-0f88e80871fd81e91"
  instance_type = "t2.micro"
  tags = {
    Name        = "testing"
    Environment = "dev"
  }
}

resource "aws_security_group" "simple_sg" {
    name = "simple-sg"
    description = "This is a test security group"
    
    ingress {
     from_port       = 22  // Number does not use " "
     to_port         = 22
     protocol        = "tcp" // everything inside " " is string
     cidr_blocks     = ["0.0.0.0/0"] // List of string
    }
    egress {
     from_port        = 0
     to_port          = 0
     protocol         = "-1" //tcp, udp, icmp
     cidr_blocks      = ["0.0.0.0/0"]
    }
}
# Everything inside " " is string

# Block && Argument
# Terraform has 2 main blocks (1. resource and 2.data source)
# Recourse Block is to create and manage resources 
# Recource block has 2 labels: 1. first_label, second_label
# Interpolation (Referencing to another thing)
# FIRST_LABEL= indicates the resource that you want to create or manage, defined by Hashicorp (not defined by us)
# SECOND_LABEL= indicates the logical name or logical ID for your Terraform resource (it is not the name of the instance, it is the name of the block), it needs to be unique within the directory
# SECOND_LABEL is defined by the author (by us)

# Terraform then starts with { } (curly blaces)
# Then come argument (ami, instance_type, tags)
# Arguments are configurations of your resource
# Argument is simple: key = value (ami = "ami-0f88e80871fd81e91")
# Refer to Resource in TF platform, not Data source--> both have similar services 

# Attributes are the values that are known after the creation (arn, id, etc.)
# Arguments are known before, as they are related to the configuration of recourses
# Overriding aspect: If an AMI is specified in the Launch Template, setting ami will override the AMI specified in the Launch Template.
