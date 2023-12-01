region = "us-west-1"
vpc_name = "my_vpc"

vpc_ip = "10.0.0.0/16"

AZ = ["us-west-1b", "us-west-1c"]

public_subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24"]

public_subnet_tags = ["public_subnet_1", "public_subnet_2"]

private_subnets_cidr = ["10.0.3.0/24", "10.0.4.0/24"]

private_subnet_tags = ["private_subnet_1", "private_subnet_2"]

ami = "ami-06d4b7182ac3480fa"

public_ec2_tags = [ "public1","public2"]

private_ec2_tags = ["private1","private2"]

lb_name = "my-lb"

lb_type = "application"
