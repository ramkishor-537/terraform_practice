resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "terraform"
    Project = "roboshop"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow-all-terraform" # this is for AWS account
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  dynamic "ingress" { # ingress is a special variable
    for_each = toset(var.ingress_rules) # accept var.ingress_rules of any data type list, set, map and accept only from dynamic block instead of resource block 
    content{
        from_port        = ingress.value.port # ingress is a special variable
        to_port          = ingress.value.port
        protocol         = "tcp"
        cidr_blocks      = ingress.value.cidr_blocks
        description      = ingress.value.description
    }
  }

  tags = {
    Name = "allow-all-terraform"
  }
}