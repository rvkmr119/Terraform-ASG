resource "aws_autoscaling_group" "asg" {
  depends_on = ["aws_lb.test"]
  name = "Terraform_ASG"
  max_size = 3
  min_size = 1
  desired_capacity = 1
  health_check_grace_period = 30
  health_check_type = "EC2"
  force_delete = true
  launch_configuration = aws_launch_configuration.lc.name
  vpc_zone_identifier = ["${var.subs[0]}", "${var.subs[1]}", "${var.subs[2]}"]
  target_group_arns = ["${aws_lb_target_group.ntg.arn}"]
}


resource "aws_autoscaling_policy" "asgp" {
  name = "Terraform_ASG_SP"
  adjustment_type        = "PercentChangeInCapacity"
  policy_type = "StepScaling"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  step_adjustment {
  scaling_adjustment = 1
  metric_interval_lower_bound = 0
    }
  step_adjustment {
  scaling_adjustment = -1
  metric_interval_upper_bound = 0
  }

}
