resource "aws_elb" "back-elb" {
    name                        = "back-elb"
    subnets                     = [aws_subnet.back-subnet-a.id,aws_subnet.back-subnet-b.id]
    security_groups             = [aws_security_group.back-load-balancer.id]
    //instances                   = [aws_instance.BACK1.id,aws_instance.BACK2.id]
    cross_zone_load_balancing   = true
    idle_timeout                = 60
    connection_draining         = true
    connection_draining_timeout = 60
    internal                    = true

    listener {
        instance_port      = 80
        instance_protocol  = "http"
        lb_port            = 80
        lb_protocol        = "http"
        ssl_certificate_id = ""
    }

    health_check {
        healthy_threshold   = 10
        unhealthy_threshold = 2
        interval            = 15
        target              = "TCP:80"
        timeout             = 5
    }
}
