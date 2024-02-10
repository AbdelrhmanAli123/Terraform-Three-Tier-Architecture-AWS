resource "aws_eip" "nat_eip" {
  count = 2
  vpc   = true
}

resource "aws_nat_gateway" "nat_gateway" {
  count         = 2
  allocation_id = aws_eip.nat_eip[*].id
  subnet_id     = aws_subnet.public_subnets[*].id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_eip.nat_eip]
}
