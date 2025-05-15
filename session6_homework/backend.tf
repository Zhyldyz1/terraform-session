terraform {
  backend "s3" {
    bucket  = "terraform-session-backend-bucket-zhyldyz"
    key     = "session7/homework/terraform.tfstate"
    encrypt = true
  }
}