resource "aws_db_subnet_group" "default" {
  name        = "my-rds-subnet-group"
  description = "My DB Subnet Group"

  subnet_ids = [
    aws_subnet.private_subnets[0].id,  # Subnet in us-west-1a
    aws_subnet.private_subnets[1].id,  # Subnet in us-west-1b
    # Add more subnets in different AZs as needed
  ]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "username"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  count                = length(var.private_subnets_cidr)
  availability_zone    = element(["us-west-1c", "us-west-1b"], count.index)  # Specify AZs here
  db_subnet_group_name = aws_db_subnet_group.default.name
  multi_az             = false
  vpc_security_group_ids = [aws_security_group.DB_SG.id]
}
