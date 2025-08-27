provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "trainee-uladzimir-boki-flask-app-bucket"
    key = "terraform.tfstate"
    region = "eu-north-1"
    dynamodb_table = "trainee-uladzimir-boki-terraform-locks"
    encrypt        = true
  }
}

resource "aws_ecr_repository" "my_app_ecr" {
  name = "devops/my-app"
}

resource "aws_security_group" "my_app_sg" {
  name_prefix = "my-app-sg"
  description = "Security group for my-app EC2 instance"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_app_insatnce" {
    ami = "ami-0a716d3f3b16d290c"
    instance_type = var.instance_type
    key_name = var.ec2_key_pair_name
    vpc_security_group_ids = [aws_security_group.my_app_sg.id]

    tags = {
        Name = "my-app-instance"
    }
}