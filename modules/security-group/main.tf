# Create sg with ingress rule that allows SSH and HTTP access
resource "aws_security_group" "web-sg" {
    name       = "${var.env}-web-sg"
    vpc_id     = var.vpc_id
    description = "Security group for web servers in ${var.env} environment - Allows SSH and HTTP access"

    ingress {
        description      = "Allow SSH access"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] # not recommended for production, consider restricting to specific IPs
    }

    ingress {
        description = "Allow HTTP access"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1" # all protocols
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name        = "${var.env}-web-sg"
        Environment = var.env
    }


}

