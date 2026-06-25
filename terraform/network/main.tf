resource "aws_eip" "app_ip" {
  domain = "vpc"

  tags = {
    Name = "flask-app-eip"
  }
}

resource "aws_eip_association" "app_ip_assoc" {
  instance_id   = aws_instance.server_app.id
  allocation_id = aws_eip.app_ip.id
}
