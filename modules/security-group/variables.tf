variable "env" {
    description = "Environment name (e.g., dev, staging, prod)"
    type        = string
}

variable "vpc_id" {
    description = "The ID of the VPC where the security group will be created"
    type        = string
}