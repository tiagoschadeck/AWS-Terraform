resource "aws_lb_target_group" "back-app-cluster" {
  name              = "back-app-cluster"
  port              = "80"
  protocol          = "TCP"
  proxy_protocol_v2 = "false"
  target_type       = "instance"
  vpc_id            = aws_vpc.vpc-sre.id
}

resource "aws_lb_target_group" "front-app-cluster" {
  deregistration_delay = "300"

  health_check {
    enabled             = "true"
    healthy_threshold   = "5"
    interval            = "15"
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
    unhealthy_threshold = "2"
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "front-app-cluster"
  port                          = "80"
  protocol                      = "HTTP"
  slow_start                    = "0"

  stickiness {
    cookie_duration = "86400"
    enabled         = "false"
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = aws_vpc.vpc-sre.id
}
