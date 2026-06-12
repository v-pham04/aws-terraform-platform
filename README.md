# AWS Multi-Environment Infrastructure Platform via Terraform

## 📌 Project Overview
An enterprise-grade, production-ready Infrastructure as Code (IaC) repository that automates the deployment of an isolated, multi-environment AWS cloud architecture. Utilizing **Terraform Modules**, this platform provisions separate **Development, Testing, and Production** environments following cloud engineering best practices, strict network isolation, and cost-optimization principles.

To ensure continuous code quality, a **CI/CD pipeline via GitHub Actions** is integrated to automatically lint, format, and validate all infrastructure configurations upon every codebase modification.

## 🏗️ Architecture Design
The infrastructure leverages modular blueprints to achieve scalability and maintainability:

- **Networking (VPC Module):** Sets up custom Virtual Private Clouds (VPCs) with independent CIDR blocks for each environment, isolating public and private subnets, internet gateways, and custom routing tables.
- **Security (Firewall Module):** Enforces least-privilege access controls by building restrictive Security Groups that limit inbound access to critical service ports (SSH/HTTP).
- **Compute (EC2 Module):** Provisions scalable, free-tier eligible Amazon Linux compute instances bootstrapped with automated shell scripts (`user_data`) to launch an active web server immediately upon initialization.

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
```

## 🚀 Key Technical Features

- **True Code Reusability:** Zero hardcoded values within core modules. Environments are spun up dynamically by feeding environmental variables into the foundational factory blueprints.
- **Predictable Network Isolation:** Strict CIDR segmentation across environments (10.0.0.0/16, 10.1.0.0/16, 10.2.0.0/16) prevents overlapping IP spaces.
- **Automated GitOps Guardrails:** Integrated GitHub Actions pipeline enforces syntax consistency via `terraform fmt` and code structural validity via `terraform validate` on every Pull Request.
- **Cost Management Conscious:** Configured entirely out-of-the-box to run within the AWS Free Tier, explicitly prioritizing cost-effective architecture structures.

## 🛠️ Deployment & Local Verification

### Prerequisites

- Terraform CLI installed locally
- AWS CLI configured with appropriate IAM user credentials

### Execution Steps

To initialize and deploy any chosen environment, such as Development:

1. Navigate to the targeted deployment environment directory:

	```bash
	cd environments/dev
	```

2. Initialize the backend workspace and download the provider plugins:

	```bash
	terraform init
	```

3. Generate and inspect an infrastructure execution preview plan:

	```bash
	terraform plan
	```

4. Apply the structural blueprint to build live AWS resources:

	```bash
	terraform apply --auto-approve
	```
