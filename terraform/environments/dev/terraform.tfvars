aws_region = "eu-north-1"

instance_type = "t3.micro"
ec2_key_pair_name = "kp1"
security_group_name = "dev-my-app-sg"
ami_id = "ami-0a716d3f3b16d290c"
ec2_name = "dev-my-app"

vpc_cidr_block = "10.0.0.0/16"
vpc_name = "dev-my-app-vpc"
internet_gateway_name = "dev-my-app-ig"
public_subnet_cidr_block = "10.0.1.0/24"
public_subnet_name = "dev-my-app-public-subnet"
route_table_name = "dev-my-app-rt"

ecr_repository_name = "devops/my-app"