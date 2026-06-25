resource "aws_eip" "app_ip" {
  domain = "vpc"

  tags = {
    Name = "flask-app-eip"
  }
}

