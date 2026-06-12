provider "aws" {
  region = var.aws_region
}

# Deploy the VPC Module
module "vpc" {
  source   = "../../modules/vpc" # Go up 2 directories 
  env      = var.env
  vpc_cidr = "10.2.0.0/16"
}

# Deploy the security group 
module "security_group" { # This name does not have to match with the acutal module 
  source = "../../modules/security-group"
  env    = var.env
  vpc_id = module.vpc.vpc_id
}

# Deploy the EC2 Instance Module
module "ec2" {
  source            = "../../modules/ec2"
  env               = var.env
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id
}

# Output the public IP so we can see it in our terminal
output "ec2_public_ip" {
  value       = "http://${module.ec2.public_ip}"
  description = "Click this URL to view your deployed Dev web server!"
}