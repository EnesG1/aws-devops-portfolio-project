output "ECR_URI" {
    value = aws_ecr_repository.app.repository_url
}

output "server_ip" {
  value = aws_eip.app_ip.public_ip
}
