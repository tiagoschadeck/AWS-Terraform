resource "aws_lb" "alb-front" {
  drop_invalid_header_fields = "false"
  enable_deletion_protection = "false"
  enable_http2               = "true"
  idle_timeout               = "60"
  internal                   = "false"
  ip_address_type            = "ipv4"
  load_balancer_type         = "application"
  name                       = "alb-front"
  security_groups            = [aws_security_group.alb-front.id]

  subnets = [aws_subnet.subnet-front-a.id, aws_subnet.subnet-front-b.id]
}

resource "aws_lb" "elb-back" {
  enable_cross_zone_load_balancing = "false"
  enable_deletion_protection       = "false"
  internal                         = "true"
  ip_address_type                  = "ipv4"
  load_balancer_type               = "network"
  name                             = "elb-back"

  subnets = [aws_subnet.subnet-back-a.id, aws_subnet.subnet-back-b.id]
}
