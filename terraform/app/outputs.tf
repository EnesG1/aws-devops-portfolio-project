output "ECR_URI" {
    value = aws_ecr_repository.app.repository_url
}
