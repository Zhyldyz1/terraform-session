resource "aws_instance" "main" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
  tags = {
    Name        = "${var.env}-instance"
    Environment = var.env  }
  vpc_security_group_ids = [aws_security_group.main.id]
  user_data = templatefile("userdata.sh", {
    environment = var.env
  })
}

resource "aws_security_group" "main" {
  name        = "${var.env}-security-group"
  description = "allow SSH and HTTP"
  
}
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  count = length(var.ingress_ports)
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = element(var.ingress_cidrs, count.index)
  from_port         = element(var.ingress_ports, count.index)
  ip_protocol       = "tcp"
  to_port           = element(var.ingress_ports, count.index)
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}