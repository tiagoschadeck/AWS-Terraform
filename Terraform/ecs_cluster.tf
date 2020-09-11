resource "aws_ecs_cluster" "back-app-cluster" {
  name = "back-app-cluster"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}

resource "aws_ecs_cluster" "front-app-cluster" {
  name = "front-app-cluster"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}
