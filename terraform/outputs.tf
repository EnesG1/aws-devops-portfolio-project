output "ECR_URI" {
    value = aws_ecr_repository.app.repository_url
}

output "server_ip" {
  value = aws_instance.server_app.public_ip
}
