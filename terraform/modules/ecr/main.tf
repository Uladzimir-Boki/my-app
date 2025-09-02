resource "aws_ecr_repository" "my_app_ecr" {
  name = var.ecr_repository_name
}