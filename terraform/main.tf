provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "trainee-uladzimir-boki-flask-app-bucket"
    key    = "terraform.tfstate"
    region = "eu-north-1"
    dynamodb_table = "trainee-uladzimir-boki-terraform-locks"
    encrypt        = true
  }
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "my-app-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my-app-igw"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "my-app-public-subnet"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "my-app-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_ecr_repository" "my_app_ecr" {
  name = "devops/my-app"
}

resource "aws_security_group" "my_app_sg" {
  name        = "my-app-sg"
  description = "Security group for my-app EC2 instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
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

resource "aws_instance" "my_app_instance" {
  ami                    = "ami-0a716d3f3b16d290c"
  instance_type          = var.instance_type
  key_name               = var.ec2_key_pair_name
  vpc_security_group_ids = [aws_security_group.my_app_sg.id]
  subnet_id              = aws_subnet.public.id

  tags = {
    Name = "my-app-instance"
  }

  user_data = file("${path.module}/install_docker_aws.sh")
}