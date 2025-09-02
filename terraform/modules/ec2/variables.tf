variable "security_group_name" {
  description = "Sceuriry group name"
  type = string
}

variable "vpc_id" {
  description = "VPC Id"
  type = string
}

variable "ami_id" {
  description = "AMI for instance" # "ami-0a716d3f3b16d290c"
  type = string
}

variable "instance_type" {
  description = "Instance type"
  type = string
}

variable "ec2_key_pair_name" {
  description = "EC2 ssh key pair name"
  type = string
}

variable "public_subnet_id" {
  description = "AWS public subnet Id for instance"
  type = string
}

variable "ec2_name" {
  description = "Instance name"
  type = string
}

