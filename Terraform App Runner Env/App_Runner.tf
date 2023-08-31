resource "aws_apprunner_service" "deploy" {
  service_name = "terraform_deployer"

  source_configuration {
    image_repository {
      image_configuration {
        port = var.deployer_port
      }
      image_identifier      = "${aws_ecr_repository.terraform_ecr.repository_url}:latest"
      image_repository_type = "ECR"
    }

    authentication_configuration {
      access_role_arn = aws_iam_role.role.arn
    }
    auto_deployments_enabled = false
  }

  tags = {
    Name = "terraform_deployer"
  }
}
output "deploy_url" {
  value = aws_apprunner_service.deploy.service_url
}
