resource "aws_autoscaling_group" "web_asg" {
  name                      = "session5-web-asg"
  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 2
  vpc_zone_identifier       = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  target_group_arns         = [aws_lb_target_group.app_tg.arn]
  health_check_type         = "EC2"
  force_delete              = true

  launch_template {
    id      = aws_launch_template.web_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "session5-web-asg"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "session5"
    propagate_at_launch = true
  }
}
