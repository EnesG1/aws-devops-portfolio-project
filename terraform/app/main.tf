data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical

  filter {
    name = "name"

    values = [
      "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
    ]
  }

  filter {
    name = "virtualization-type"

    values = ["hvm"]
  }
}


data "terraform_remote_state" "network" {
  backend = "local"

  config = {
    path = "../network/terraform.tfstate"
  }
}
resource "aws_eip_association" "app_ip_assoc" {
  instance_id   = aws_instance.server_app.id
  allocation_id = data.terraform_remote_state.network.outputs.eip_allocation_id
}

resource "aws_ecr_repository" "app" {
  name   = var.repo_name

 force_delete = true

  image_scanning_configuration {
    scan_on_push = true

    
  }
}

resource "aws_instance" "server_app" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  key_name = "DevOps-Key"

  vpc_security_group_ids = [
    aws_security_group.flask_app.id
  ]

  tags = {
    Name = "flask-devops-server"
  }
}


resource "aws_security_group" "flask_app" {
  name = "flask-app-sg"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}