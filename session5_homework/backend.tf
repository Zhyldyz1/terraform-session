terraform {
  backend "s3" {
    bucket         = "terraform-session-backend-bucket-zhyldyz"
    key            = "session5/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}