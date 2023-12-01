resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "public_subnets_association" {
  count          = length(var.public_subnets_cidr)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "exampleee"
  }
}


resource "aws_route_table_association" "private_subnets_association" {
  count          = length(var.private_subnets_cidr)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}

