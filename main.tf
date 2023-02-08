resource "aws_instance" "multiple_ins" {
  #count = length(var.names)
  for_each = toset(var.names)
  instance_type = "t2.micro"
  ami           = "ami-2757f631"
  subnet_id = data.aws_subnet.selected.id
  tags = {
    #Name = var.names[count.index]
    Name = each.value
  }
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  depends_on = [
    "aws_security_group.allow_tls"
  ]
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}