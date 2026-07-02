resource "aws_eip" "app_ip" {
  domain = "vpc"

  tags = {
    Name = "flask-app-eip"
  }
}

resource "aws_ecr_repository" "app" {
  name  = var.repo_name

 force_delete = true

  image_scanning_configuration {
    scan_on_push = true

    
  }
}