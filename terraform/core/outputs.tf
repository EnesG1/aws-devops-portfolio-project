output "eip_allocation_id" {
  value = aws_eip.app_ip.id
}

output "public_ip" {
  value = aws_eip.app_ip.public_ip
}

output "ecr_repository_url" {
  value = aws_ecr_repository.app.repository_url
}
output "ecr_repository_name" {
  value = aws_ecr_repository.app.name
}