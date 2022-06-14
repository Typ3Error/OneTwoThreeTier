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
