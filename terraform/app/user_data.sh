#!/bin/bash
set -e


apt update -y


apt install -y docker.io curl unzip


systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install


REGION="eu-central-1"
ACCOUNT="540361297478"
REPO="flask-crud-app"

IMAGE="$ACCOUNT.dkr.ecr.$REGION.amazonaws.com/$REPO:latest"


sleep 10


aws ecr get-login-password --region $REGION | docker login \
  --username AWS \
  --password-stdin $ACCOUNT.dkr.ecr.$REGION.amazonaws.com


docker pull $IMAGE

docker run -d \
  -p 80:5000 \
  --restart unless-stopped \
  --name flask \
  $IMAGE