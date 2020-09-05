resource "aws_autoscaling_group" "EcsInstanceAsg-front-cluster-app" {
    desired_capacity          = 1
    health_check_grace_period = 2
    health_check_type         = "EC2"
    launch_configuration      = "EcsInstanceLc-front-cluster-app"
    max_size                  = 2
    min_size                  = 1
    name                      = "EcsInstanceAsg-front-cluster-app"
    vpc_zone_identifier       = [aws_subnet.front-subnet-a.id,aws_subnet.front-subnet-b.id]
    target_group_arns         = [aws_alb.front-alb.arn]

    tag {
        key   = "Name"
        value = "ECS-Instance-ContainerService-front-cluster-app"
        propagate_at_launch = true
    }
}


resource "aws_autoscaling_group" "EcsInstanceAsg-back-cluster-app" {
    desired_capacity          = 1
    health_check_grace_period = 2
    health_check_type         = "EC2"
    launch_configuration      = "EcsInstanceLc-back-cluster-app"
    max_size                  = 2
    min_size                  = 1
    name                      = "EcsInstanceAsg-back-cluster-app"
    vpc_zone_identifier       = [aws_subnet.back-subnet-a.id,aws_subnet.back-subnet-b.id]
    load_balancers            = ["${aws_elb.back-elb.id}"]

    tag {
        key   = "Name"
        value = "ECS-Instance-ContainerService-back-cluster-app"
        propagate_at_launch = true
    }
}
