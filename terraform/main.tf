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


module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block = var.vpc_cidr_block
  vpc_name = var.vpc_name
  internet_gateway_name = var.internet_gateway_name
  public_subnet_cidr_block = var.public_subnet_cidr_block
  public_subnet_name = var.public_subnet_name
  route_table_name = var.route_table_name
}

module "ecr" {
  source = "./modules/ecr"

  ecr_repository_name = var.ecr_repository_name
}

module "ec2" {
  source = "./modules/ec2"

  security_group_name = var.security_group_name
  vpc_id = module.vpc.vpc_id
  ami_id = var.ami_id
  instance_type = var.instance_type
  ec2_key_pair_name = var.ec2_key_pair_name
  public_subnet_id = module.vpc.public_subnet_id
  ec2_name = var.ec2_name
}