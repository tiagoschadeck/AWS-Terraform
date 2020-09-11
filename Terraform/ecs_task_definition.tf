resource "aws_ecs_task_definition" "back-app-cluster" {
  container_definitions    = "[{\"cpu\":0,\"environment\":[{\"name\":\"NODE_ENV\",\"value\":\"production\"}],\"essential\":true,\"image\":\"354793276020.dkr.ecr.us-east-1.amazonaws.com/back\",\"memoryReservation\":512,\"mountPoints\":[],\"name\":\"back-app\",\"portMappings\":[{\"containerPort\":80,\"hostPort\":80,\"protocol\":\"tcp\"}],\"volumesFrom\":[]}]"
  family                   = "back-app-cluster"
  requires_compatibilities = ["EC2"]
}

resource "aws_ecs_task_definition" "front-app-cluster" {
  container_definitions    = "[{\"cpu\":0,\"environment\":[{\"name\":\"NODE_ENV\",\"value\":\"production\"}],\"essential\":true,\"image\":\"354793276020.dkr.ecr.us-east-1.amazonaws.com/front\",\"memoryReservation\":512,\"mountPoints\":[],\"name\":\"front-app\",\"portMappings\":[{\"containerPort\":80,\"hostPort\":80,\"protocol\":\"tcp\"}],\"volumesFrom\":[]}]"
  family                   = "front-app-cluster"
  requires_compatibilities = ["EC2"]
}
