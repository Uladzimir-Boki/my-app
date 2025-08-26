variable "aws_region" {
  description = "The AWS region to deploy resource to."
  type = string
  default = "eu-north-1"
}

variable "instance_type" {
  description = "The EC2 instance type"
  type = string
  default = "t3.micro"
}

variable "ec2_key_pair_name" {
  description = "The name of the pre-existing EC2 key pair"
  type = string
}