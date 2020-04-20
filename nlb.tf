resource "aws_lb" "test" {
  depends_on = ["aws_launch_configuration.lc"]
  name               = var.nlb
  internal           = false
  load_balancer_type = var.lb_type
  subnets            = var.subs

  tags = {
     name= var.nlb
  }
}

resource "aws_lb_target_group" "ntg" {
  name     = var.tg
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.vpc
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = "${aws_lb.test.arn}"
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.ntg.arn}"
  }
}
