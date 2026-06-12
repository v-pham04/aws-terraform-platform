variable "env" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "instance_type" {
  description = "The size of the EC2 instance (e.g., t2.micro for free tier)"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be launched."
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the EC2 instance."
  type        = string
}