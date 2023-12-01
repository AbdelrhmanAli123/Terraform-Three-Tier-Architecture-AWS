resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnets_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets_cidr[count.index]
  availability_zone       = var.AZ[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_tags[count.index]
  }
}

resource "aws_subnet" "private_subnets" {
  count                   = length(var.private_subnets_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnets_cidr[count.index]
  availability_zone       = var.AZ[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name = var.private_subnet_tags[count.index]
  }
}

