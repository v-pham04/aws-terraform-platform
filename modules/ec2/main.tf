# Find the latest automated Amazon Linux 3 AMI (Operating System Image)
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "web-instance" {
  ami             = data.aws_ami.amazon_linux.id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = [var.security_group_id] # An instance can be associated with multiple sg

  # This script runs automatically on startup to host a simple webpage
  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Welcome to the ${var.env} Environment!</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name        = "web-${var.env}"
    Environment = var.env
  }
}