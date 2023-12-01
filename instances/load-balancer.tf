resource "aws_lb" "load-balancer" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = var.lb_type
#   security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [for public_subnets_id in var.public_subnets_id : public_subnets_id ]  


   enable_deletion_protection = false

  tags = {
    Environment = "dev"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.load-balancer.arn
  port              = "80"
  protocol          = "HTTP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # # certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group.arn
  }
}


resource "aws_lb_target_group" "target-group" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

}

resource "aws_lb_target_group_attachment" "test" {
  count            = length(var.public_ec2_tags)
  target_group_arn = aws_lb_target_group.target-group.arn
  target_id        = aws_instance.public_instances[count.index].id
  port             = 80
}

