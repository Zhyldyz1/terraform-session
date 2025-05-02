resource "aws_instance" "first_ec2" {
  ami           = "ami-0f88e80871fd81e91"
  instance_type = "t2.micro"

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo '<html><body><h1>Session-2 homework is complete! </h1></body></html>' > /var/www/html/index.html
    EOF

  tags = {
    Name        = "my-terraform-webserver"
    Environment = "dev"
  }
}