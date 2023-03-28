provider "aws" {
  region = var.region
}

resource "aws_instance" "back-new" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = aws_key_pair.generated_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.sg_security_group.id]
  user_data = var.aplication_data
  tags = {
    Name = "sg-group-back"
  }
}

resource "aws_security_group" "sg_security_group" {
    name = "back-server-sg"

    ingress {
      cidr_blocks = ["0.0.0.0/0"]
      description = "Port 8080 access"
      from_port = 8080
      to_port = 8080
      protocol= "TCP"
    }
}

resource "aws_key_pair" "generated_key_pair" {
  key_name   = var.key_pair_name
  public_key = file("${var.key_pair_name}.pub")
}


