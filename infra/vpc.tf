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
resource "aws_subnet" "tetra_public_sub_one" {
  vpc_id     = aws_vpc.tetra_VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "tetra_public_sub_one"
  }
}

resource "aws_subnet" "tetra_public_sub_two" {
  vpc_id     = aws_vpc.tetra_VPC.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "tetra_public_sub_two"
  }
}

resource "aws_subnet" "tetra_private_sub_one" {
  vpc_id     = aws_vpc.tetra_VPC.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "tetra_private_sub_one"
  }
}

resource "aws_subnet" "tetra_private_sub_two" {
  vpc_id     = aws_vpc.tetra_VPC.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "tetra_private_sub_two"
  }
}

resource "aws_route_table" "tetra_public_rt" {
  vpc_id = aws_vpc.tetra_VPC.id

  route = []

  tags = {
    Name = "tetra_public_rt"
  }
}

resource "aws_route" "tetra_pub_gw" {
  route_table_id         = aws_route_table.tetra_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.tetra_gw.id


}

resource "aws_route_table" "tetra_private_rt" {
  vpc_id = aws_vpc.tetra_VPC.id

  route = []

  tags = {
    Name = "tetra_private_rt"
  }
}

resource "aws_route_table_association" "tetra_pub_association_one" {
  subnet_id      = aws_subnet.tetra_public_sub_one.id
  route_table_id = aws_route_table.tetra_public_rt.id
}

resource "aws_route_table_association" "tetra_pub_association_two" {
  subnet_id      = aws_subnet.tetra_public_sub_two.id
  route_table_id = aws_route_table.tetra_public_rt.id
}







