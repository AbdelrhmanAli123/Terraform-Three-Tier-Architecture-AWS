resource "aws_vpc" "main" {
  cidr_block = var.vpc_ip
  tags = {
    Name = var.vpc_name
  }
}