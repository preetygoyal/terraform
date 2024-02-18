provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "example" {
  name        = "example-allow-all"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0c02fb55956c7d316"  
  instance_type = var.instance_type
  security_groups = [aws_security_group.example.name]

  tags = {
    Name = "ExampleInstance"
  }
}

variable "instance_type" {}
