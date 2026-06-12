AWS Multi-Environment Infrastructure Platform (Terraform)
📌 Project Overview
This project is an enterprise-grade Infrastructure as Code (IaC) platform designed to automate the deployment of a secure, scalable, and isolated multi-environment AWS architecture using Terraform.
It provisions separate Development, Testing, and Production environments using reusable Terraform modules, following cloud engineering best practices such as environment isolation, least-privilege security, and cost optimization.
A fully automated CI/CD pipeline via GitHub Actions ensures continuous code quality by running formatting, linting, and validation checks on every change.

🏗️ Architecture Overview
This infrastructure is built using modular Terraform components to ensure scalability, reusability, and maintainability:
🌐 Networking (VPC Module)
Creates isolated Virtual Private Clouds (VPCs) per environment
Defines separate CIDR blocks for Dev, Test, and Prod
Configures public/private subnets, internet gateways, and routing tables
🔐 Security (Security Group Module)
Implements least-privilege security principles
Restricts inbound traffic to required ports (e.g., SSH, HTTP)
Provides environment-specific firewall configurations
💻 Compute (EC2 Module)
Provisions Amazon Linux EC2 instances (Free Tier eligible)
Uses user_data scripts for automated bootstrapping
Launches a ready-to-use web server on deployment

📁 Repository Structure
aws-terraform-platform/
├── .github/workflows/
│   └── terraform-check.yml      # CI/CD pipeline (fmt, lint, validate)
├── modules/                     # Reusable Terraform modules
│   ├── vpc/                     # VPC networking module
│   ├── security-group/         # Firewall/security rules module
│   └── ec2/                    # Compute instance module
└── environments/               # Environment-specific deployments
    ├── dev/                    # Development environment
    ├── test/                   # Testing/Staging environment
    └── prod/                   # Production environment

⚙️ Key Features
Modular Design: Fully reusable Terraform modules with no hardcoded environment values
Environment Isolation: Strict CIDR segmentation (e.g., 10.0.0.0/16, 10.1.0.0/16, 10.2.0.0/16)
CI/CD Automation: GitHub Actions pipeline enforces:
terraform fmt
terraform validate
Cost-Efficient: Designed to operate within AWS Free Tier limits
Scalable Architecture: Easily extendable to additional environments or services

🚀 Deployment & Local Setup
📦 Prerequisites
Terraform CLI installed
AWS CLI configured with valid IAM credentials
🛠️ Deployment Steps
To deploy an environment (e.g., Development):
# Navigate to environment
cd environments/dev
# Initialize Terraform
terraform init
# Preview changes
terraform plan
# Apply infrastructure
terraform apply --auto-approve
