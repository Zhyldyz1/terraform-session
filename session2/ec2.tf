resource "aws_instance" "web" {
  ami           = "ami-01cd4de4363ab6ee8"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-session-instance"
  }
}

// Each Terraform configuration file has .tf extension

# There are 2 mains blocks in Terraform
# 1. Resource Block = Create and Manage Resources (AWS Services or Infrastructure)
#    - Resource Block expects 2 labels
# 2. Data Source Block = ?


// Syntax:
// resource = block
// aws_instance = first_label, (resource type), predefined by Terraform
// web = second_label, (logical name or logical id), defined by Author 
// ami = argument, (consists of Key/Value, Name/Value), configurations of the resource
    // - Key = predefined by Terraform
    // - Value = defined by Author


// Working Directory
#    - Place where you run Terraform Commands
#    - Place where you have Terraform Configurations Files
#    - (Root Module)


// Terraform has Backend (terraform.tfstate)
    // - Local Backend = gets generated in the same working directory
    // - Remote Backend = gets generated in the remote system such s3 bucket

// What is in the Backend?
    // - Stores your Infrastructure Information
    // - Shows the desired state of your Infrastucture