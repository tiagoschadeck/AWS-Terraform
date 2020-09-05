resource "aws_alb" "front-alb" {
    idle_timeout    = 60
    internal        = false
    name            = "front-alb"
    security_groups = [aws_security_group.front-load-balancer.id]
    subnets         = [aws_subnet.front-subnet-a.id,aws_subnet.front-subnet-b.id]

    enable_deletion_protection = false
}

resource "aws_alb_target_group" "front-target-group" {
    name                = "front-target-group"
    port                = "80"
    protocol            = "HTTP"
    vpc_id              = aws_vpc.vpc-sre-challenge.id

    health_check {
        healthy_threshold   = "5"
        unhealthy_threshold = "2"
        interval            = "15"
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = "5"
    }
}

/*
resource "aws_alb_listener" "alb-listener" {
    load_balancer_arn = aws_alb.front-alb.arn
    port              = "80"
    protocol          = "HTTP"

    default_action {
        target_group_arn = aws_alb_target_group.front-target-group.arn
        type             = "forward"
    }
}
*/
