resource "aws_security_group" "my_app_sg" {
  name        = var.security_group_name
  description = "Security group for my-app EC2 instance"
  vpc_id      = var.vpc_id

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
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.ec2_key_pair_name
  vpc_security_group_ids = [aws_security_group.my_app_sg.id]
  subnet_id              = var.public_subnet_id

  tags = {
    Name = var.ec2_name
  }

  user_data = file("${path.module}/install_docker_aws.sh")
}