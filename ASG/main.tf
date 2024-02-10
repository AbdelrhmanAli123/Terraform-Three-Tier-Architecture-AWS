resource "aws_launch_configuration" "web" {
  name_prefix = "web-"
  image_id = "ami-087c17d1fe0178315" 
  instance_type = "t2.micro"
  key_name = "tests"
  security_groups = [ var.public_SG_EC2s ]
  associate_public_ip_address = true
  user_data = "${file("install-apache.sh")}"
}

resource "aws_autoscaling_group" "web" {
  name = "my-asg"
  min_size             = 1
  desired_capacity     = 1
  max_size             = 2
  
  health_check_type    = "ELB"
  load_balancers =  [var.elb_id]
  launch_configuration = "${aws_launch_configuration.web.name}"
  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]
  vpc_zone_identifier  = [for public_subnets_id in var.public_subnets_id : public_subnets_id]# Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }tag {
    key                 = "Name"
    value               = "web"
    propagate_at_launch = true

 }
}

resource "aws_autoscaling_policy" "web_policy_up" {
  name = "web_policy_up"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "${aws_autoscaling_group.web.name}"
}