variable "vpc_cidr_block" {
  description = "CIDR bloc for VPC"
  type = string
}

variable "vpc_name" {
  description = "VPC name"
  type = string
}

variable "internet_gateway_name" {
  description = "Internet gateway name"
  type = string
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for public subnet"
  type = string # "10.0.1.0/24"
}

variable "public_subnet_name" {
  description = "Public subnet name"
  type = string
}

variable "route_table_name" {
  description = "AWS route table name"
  type = string
}