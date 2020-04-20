resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name                = "terraform-test-High-CPUUtilization"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "60"
  statistic                 = "Maximum"
  threshold                 = "40"
  alarm_description         = "This metric monitors ec2's High cpu utilization"

  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.asg.name}"
  }

  alarm_actions     = ["${aws_autoscaling_policy.asgp.arn}"]
}


resource "aws_cloudwatch_metric_alarm" "low_cpu" {
  alarm_name                = "terraform-test-LOW-CPUUtilization"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = "1"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "60"
  statistic                 = "Minimum"
  threshold                 = "35"
  alarm_description         = "This metric monitors ec2's Low cpu utilization"

  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.asg.name}"
  }

  alarm_actions     = ["${aws_autoscaling_policy.asgp.arn}"]
}
