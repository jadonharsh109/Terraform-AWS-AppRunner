resource "aws_ecr_repository" "terraform_ecr" {
  name                 = "terraform_registory"
  image_tag_mutability = "MUTABLE"
  force_delete         = "true"

  provisioner "local-exec" {
    command = "aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${aws_ecr_repository.terraform_ecr.registry_id}.dkr.ecr.${var.aws_region}.amazonaws.com"
    when    = create
  }

  provisioner "local-exec" {
    command = "docker build -t ${aws_ecr_repository.terraform_ecr.name} ${var.dockerfile_path}"
  }

  provisioner "local-exec" {
    command = "docker tag ${aws_ecr_repository.terraform_ecr.name}:latest ${aws_ecr_repository.terraform_ecr.repository_url}:latest"
  }

  provisioner "local-exec" {
    command = "docker push ${aws_ecr_repository.terraform_ecr.repository_url}:latest"
  }

}

output "ecr_url" {
  value = aws_ecr_repository.terraform_ecr.repository_url
}
