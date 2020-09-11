resource "aws_ecs_service" "front-app-cluster" {
  cluster = "front-app-cluster"

  deployment_controller {
    type = "ECS"
  }

  deployment_maximum_percent         = "200"
  deployment_minimum_healthy_percent = "100"
  desired_count                      = "1"
  enable_ecs_managed_tags            = "false"
  health_check_grace_period_seconds  = "300"
  launch_type                        = "EC2"

  load_balancer {
    container_name   = "front-app"
    container_port   = "80"
    target_group_arn         = aws_lb_target_group.front-app-cluster.arn
  }

  name = "front-app-cluster"

  ordered_placement_strategy {
    field = "attribute:ecs.availability-zone"
    type  = "spread"
  }

  ordered_placement_strategy {
    field = "instanceId"
    type  = "spread"
  }

  scheduling_strategy = "REPLICA"
  task_definition     = aws_ecs_task_definition.front-app-cluster.arn
}


resource "aws_ecs_service" "back-app-cluster" {
  cluster = "back-app-cluster"

  deployment_controller {
    type = "ECS"
  }

  deployment_maximum_percent         = "200"
  deployment_minimum_healthy_percent = "100"
  desired_count                      = "1"
  enable_ecs_managed_tags            = "false"
  health_check_grace_period_seconds  = "120"
  launch_type                        = "EC2"

  load_balancer {
    container_name   = "back-app"
    container_port   = "80"
    target_group_arn         = aws_lb_target_group.back-app-cluster.arn
  }

  name = "back-app-cluster"

  ordered_placement_strategy {
    field = "attribute:ecs.availability-zone"
    type  = "spread"
  }

  ordered_placement_strategy {
    field = "instanceId"
    type  = "spread"
  }

  scheduling_strategy = "REPLICA"
  task_definition     = aws_ecs_task_definition.back-app-cluster.arn
}
