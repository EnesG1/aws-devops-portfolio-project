output "server_public_ip" {
  value = aws_instance.server_app.public_ip
}