resource "aws_instance" "public_instances" {
  count = length(var.public_ec2_tags)
  ami           = var.ami
  instance_type = "t2.micro"
  availability_zone = var.AZ[count.index]
  subnet_id = var.public_subnets_id[count.index]
  security_groups = [ var.public_SG_EC2s ]
  user_data = file("instances\\install-apache.sh") 
  tags = {
    Name = var.public_ec2_tags[count.index]
  }
}

resource "aws_instance" "private_instances" {
  count = length(var.private_ec2_tags)
  security_groups = [ var.private_SG_EC2s]
  ami           = var.ami
  instance_type = "t2.micro"
  availability_zone = var.AZ[count.index]
  subnet_id = var.private_subnets_id[count.index]
  tags = {
    Name = var.private_ec2_tags[count.index]
  }
}

