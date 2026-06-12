variable "env" {
    description = "The deployment environment (e.g., dev, test, prod)"
    type        = string
}

variable "vpc_cidr" {
    description = "The overall IP range for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The IP range for the public subnet (connected to internet)"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "The IP range for the private subnet (isolated)"
  type        = string
  default     = "10.0.2.0/24"
}