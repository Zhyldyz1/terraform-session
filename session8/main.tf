resource "aws_key_pair" "main" {
  key_name   = "TerraformLocalKey"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_security_group" "main" {
  name        = "main"
  description = "this is a security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "main" {
  ami                    = "ami-0f88e80871fd81e91"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.main.key_name
  vpc_security_group_ids = [aws_security_group.main.id]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip
    private_key = file("~/.ssh/id_ed25519")
  }

  provisioner "file" {
    source      = "/Users/jyldyz/Downloads/F/terraform-session/session8/index.html"
    destination = "/tmp/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install -y httpd",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]
  }

  tags = {
    Name = "terraform-session-instance"
  }
}

resource "null_resource" "main" {
    provisioner "local-exec" {
        command = "echo Testing Local Exec' > index.html"
      
    }
  
}