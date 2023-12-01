resource "aws_instance" "public_instances" {
  count = length(var.public_ec2_tags)
  ami           = var.ami
  instance_type = "t2.micro"
  availability_zone = var.AZ[count.index]
  subnet_id = aws_subnet.public_subnets[count.index].id
  security_groups = [ aws_security_group.SG_public_EC2s.id ]
  user_data = file("install-apache.sh")
  tags = {
    Name = var.public_ec2_tags[count.index]
  }
}

resource "aws_instance" "private_instances" {
  security_groups = [ aws_security_group.SG_private_EC2s.id ]
  count = length(var.private_ec2_tags)
  ami           = var.ami
  instance_type = "t2.micro"
  availability_zone = var.AZ[count.index]
  subnet_id = aws_subnet.private_subnets[count.index].id
  tags = {
    Name = var.private_ec2_tags[count.index]
  }
}

