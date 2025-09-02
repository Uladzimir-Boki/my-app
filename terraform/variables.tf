variable "aws_region" {
  description = "The AWS region to deploy resource to."
  type = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "internet_gateway_name" {
  description = "Internet gateway name"
  type = string
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for public subnet"
  type = string
}

variable "public_subnet_name" {
  description = "Public subnet name"
  type = string
}

variable "route_table_name" {
  description = "AWS route table name"
  type = string
}

variable "ec2_key_pair_name" {
  description = "The name of the pre-existing EC2 key pair"
  type = string
}

variable "ecr_repository_name" {
  description = "ECR repository name"
  type = string
}

variable "security_group_name" {
  description = "Sceuriry group name"
  type = string
}

variable "ami_id" {
  description = "AMI for instance"
  type = string
}

variable "ec2_name" {
  description = "Instance name"
  type = string
}