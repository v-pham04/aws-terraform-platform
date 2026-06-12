# Create the Main VPC
resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true

    tags = {
        Name = "${var.env}-vpc"
        Environment = var.env
    }

}

# Create the Internet Gateway for public access
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    
    tags = {
        Name = "${var.env}-igw"
        Environment = var.env
    }
}

# Create the Public Subnet
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr
    map_public_ip_on_launch = true  # Automatically assign public IPs to instances in this subnet

    tags = {
        Name = "${var.env}-public-subnet"
        Environment = var.env
    }

}

# Create the Private Subnet
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_cidr

    tags = {
        Name = "${var.env}-private-subnet"
        Environment = var.env
    }
}

# Create a Route Table for the Public Traffic
resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.main.id

    # Any traffic from resources associated with this rt whose destination is not within the VPC
    # will be routed to the Internet Gateway
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "${var.env}-public-rt"
        Environment = var.env
    }
}

# Connect the Public Subnet to the Public Route Table
resource "aws_route_table_association" "public-rt-assoc" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public-rt.id
}