# AWS Multi-Environment Infrastructure Platform via Terraform

## 📌 Project Overview
An enterprise-grade, production-ready Infrastructure as Code (IaC) repository that automates the deployment of an isolated, multi-environment AWS cloud architecture. Utilizing **Terraform Modules**, this platform provisions separate **Development, Testing, and Production** environments following cloud engineering best practices, strict network isolation, and cost-optimization principles.

To ensure continuous code quality, a **CI/CD pipeline via GitHub Actions** is integrated to automatically lint, format, and validate all infrastructure configurations upon every codebase modification.

## 🏗️ Architecture Design
The infrastructure leverages modular blueprints to achieve scalability and maintainability:

* **Networking (VPC Module):** Sets up custom Virtual Private Clouds (VPCs) with independent CIDR blocks for each environment, isolating public and private subnets, internet gateways, and custom routing tables.
* **Security (Firewall Module):** Enforces least-privilege access controls by building restrictive Security Groups that limit inbound access to critical service ports (SSH/HTTP).
* **Compute (EC2 Module):** Provisions scalable, free-tier eligible Amazon Linux compute instances bootstrapped with automated shell scripts (`user_data`) to launch an active web server immediately upon initialization.

## 📁 Repository Structure
```text
aws-terraform-platform/
├── .github/workflows/
│   └── terraform-check.yml   # Automated CI/CD syntax and linting pipeline
├── modules/                  # Reusable infrastructure factory blueprints
│   ├── vpc/                  # Network configuration files
│   ├── security-group/       # Custom firewall rules
│   └── ec2/                  # Bootstrapped compute instance definitions
└── environments/             # Live environment deployments
    ├── dev/                  # Development sandbox
    ├── test/                 # Testing/Staging configuration
    └── prod/                 # Production environment
