provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
}

# Create the VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "MyVPC"
  }
}

# Create a Subnet within the VPC
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/25" # Adjust the range if needed
  map_public_ip_on_launch =  true         # Assigns public IPs to instances

  tags = {
    Name = "MyPublicSubnet"
  }
}

# Create an Internet Gateway for the VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "MyInternetGateway"
  }
}

# Create a Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  # Route for Internet traffic
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "MyPublicRouteTable"
  }
}

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
