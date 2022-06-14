# Attach VPC And IG
resource "aws_internet_gateway_attachment" "tetra_attatchment" {
  internet_gateway_id = aws_internet_gateway.tetra_gw.id
  vpc_id              = aws_vpc.tetra_VPC.id
}

# Create a VPC
resource "aws_vpc" "tetra_VPC" {
  cidr_block = "10.0.0.0/16"
}

# Create Internet Gateway
resource "aws_internet_gateway" "tetra_gw" {}

# Configure Subnets
resource "aws_subnet" "tetra_subnet_one" {
  vpc_id     = aws_vps.tetra_VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "tetra_sub_one"
  }
}

resource "aws_subnet" "tetra_subnet_twp" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "tetra_sub_two"
  }
}

resource "aws_subnet" "tetra_subnet_three" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "tetra_sub_three"
  }
}

resource "aws_subnet" "tetra_subnet_four" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "tetra_sub_four"
  }
}


