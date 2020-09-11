resource "aws_autoscaling_group" "front-app-cluster-EcsInstanceAsg" {
  default_cooldown          = "300"
  desired_capacity          = "2"
  force_delete              = "true"
  health_check_grace_period = "300"
  health_check_type         = "ELB"
  launch_configuration      = aws_launch_configuration.front-app-cluster-EcsInstanceLc.name
  target_group_arns         = [aws_lb_target_group.front-app-cluster.arn]
  max_instance_lifetime     = "0"
  max_size                  = "2"
  metrics_granularity       = "1Minute"
  min_size                  = "1"
  name                      = "EC2ContainerService-front-app-cluster-EcsInstanceAsg"
  protect_from_scale_in     = "false"

  tag {
    key                 = "Name"
    propagate_at_launch = "true"
    value               = "ECS Instance - EC2ContainerService-front-app-cluster"
  }

  tag {
    key                 = "Description"
    propagate_at_launch = "true"
    value               = "This instance is the part of the Auto Scaling group which was created through ECS Console"
  }

  vpc_zone_identifier       = [aws_subnet.subnet-front-a.id, aws_subnet.subnet-front-b.id]
  wait_for_capacity_timeout = "10m"
}

resource "aws_autoscaling_group" "back-app-cluster-EcsInstanceAsg" {
  default_cooldown          = "300"
  desired_capacity          = "2"
  force_delete              = "true"
  health_check_grace_period = "300"
  health_check_type         = "ELB"
  launch_configuration      = aws_launch_configuration.back-app-cluster-EcsInstanceLc.name
  target_group_arns         = [aws_lb_target_group.back-app-cluster.arn]
  max_instance_lifetime     = "0"
  max_size                  = "2"
  metrics_granularity       = "1Minute"
  min_size                  = "1"
  name                      = "EC2ContainerService-back-app-cluster-EcsInstanceAsg"
  protect_from_scale_in     = "false"

  tag {
    key                 = "Name"
    propagate_at_launch = "true"
    value               = "ECS Instance - EC2ContainerService-back-app-cluster"
  }

  tag {
    key                 = "Description"
    propagate_at_launch = "true"
    value               = "This instance is the part of the Auto Scaling group which was created through ECS Console"
  }

  vpc_zone_identifier       = [aws_subnet.subnet-back-a.id, aws_subnet.subnet-back-b.id]
  wait_for_capacity_timeout = "10m"
}
