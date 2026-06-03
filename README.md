# AWS DevOps Portfolio Project

## Overview

This project demonstrates a production-style DevOps workflow using AWS, Terraform, Docker, GitHub Actions, Linux, and GitHub.

The goal is to showcase how infrastructure and application deployments can be automated through Infrastructure as Code (IaC) and CI/CD pipelines.

## Technologies Used

- AWS
- Terraform
- Docker
- GitHub Actions
- Git & GitHub
- Linux
- IAM

## Architecture

The deployment workflow follows:

```text
Developer Push
      |
GitHub Actions
      |
OIDC Authentication
      |
Terraform
      |
AWS Infrastructure
      |
Docker Deployment
      |
Running Application
```

## Project Goals

- Provision AWS infrastructure using Terraform
- Containerize applications with Docker
- Automate deployments with GitHub Actions
- Implement secure authentication using OIDC
- Demonstrate Linux administration and troubleshooting
- Follow Infrastructure as Code best practices

## Repository Structure

```text
.
├── docs/
├── terraform/
├── .github/
│   └── workflows/
└── README.md
```

## Current Status

🚧 Project in development

### Planned Features

- [ ] AWS Infrastructure Deployment
- [ ] Dockerized Application
- [ ] GitHub Actions CI Pipeline
- [ ] GitHub Actions CD Pipeline
- [ ] OIDC Authentication
- [ ] Amazon ECR Integration
- [ ] EC2 Deployment
- [ ] Monitoring and Logging

## Author

Built as a DevOps portfolio project to demonstrate practical cloud and automation skills.
