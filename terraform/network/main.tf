resource "aws_eip" "app_ip" {
  domain = "vpc"

  tags = {
    Name = "flask-app-eip"
  }
}

output "allocation_id" {
  value = aws_eip.app_ip.id
}

output "public_ip" {
  value = aws_eip.app_ip.public_ip
}