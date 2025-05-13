data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-session-backend-bucket-zhyldyz"
    key    = "session4/terraform.tfstate"
    region = "us-east-1"
  }
}

