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

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "ec2_key_pair_name" {
  description = "The name of the pre-existing EC2 key pair"
  type = string
}