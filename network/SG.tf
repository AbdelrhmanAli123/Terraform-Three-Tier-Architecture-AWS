resource "aws_security_group" "SG_public_EC2s" {
  name        = "SSG public_ec2s "
  description = "SSG for the public instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
    security_groups = [ aws_security_group.SG_LB.id ]
  }
  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sg-pub"
  }
}




// --------------- private SG----------------

resource "aws_security_group" "SG_private_EC2s" {
  name        = "SSG Private_EC2s"
  description = "SSG for the private instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "Allow traffic from public instances"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    security_groups  = [aws_security_group.SG_public_EC2s.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_pri"
  }
}

// --------------Loadbalancer SG----------------

resource "aws_security_group" "SG_LB" {
  name        = "SSG_LB "
  description = "SSG for the public instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "LB security group"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_lb"
  }
}

// ----------------------SG for DB --------------------

resource "aws_security_group" "DB_SG" {
  name        = "SSG Private_EC2s"
  description = "SSG for the private instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "Allow traffic from public instances"
    from_port        = 3306
    to_port          = 3306
    protocol         = "-1"
    security_groups  = ["${aws_security_group.SG_private_EC2s.id}"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_pri"
  }
}
