resource "aws_lb_listener" "listener-app-alb-front" {
  default_action {
    target_group_arn = aws_lb_target_group.front-app-cluster.arn
    type             = "forward"
  }

  load_balancer_arn = aws_lb.alb-front.id
  port              = "80"
  protocol          = "HTTP"
}

resource "aws_lb_listener" "listener-net-elb-back" {
  default_action {
    target_group_arn = aws_lb_target_group.back-app-cluster.arn
    type             = "forward"
  }

  load_balancer_arn = aws_lb.elb-back.id
  port              = "80"
  protocol          = "TCP"
}
