output "vpc_id" {
    value = aws_vpc.main.id
}
output "public_subnet_id" {
    value = aws_subnet.public_subnets[*].id
}

output "private_subnet_id" {
    value = aws_subnet.public_subnets[*].id
}

output "public_SG_EC2" {
    value = aws_security_group.SG_public_EC2s.id
}

output "private_SG_EC2" {
    value = aws_security_group.SG_private_EC2s.id
  
}

output "LB_SG" {
    value = aws_security_group.SG_LB.id
  
}

output "DB_SG" {
    value = aws_security_group.DB_SG.id
}
