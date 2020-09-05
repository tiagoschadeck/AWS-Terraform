/*data "aws_ecs_task_definition" "front-app-cluster" {
  task_definition = "${aws_ecs_task_definition.front-app-cluster.family}"
}

data "aws_ecs_container_definition" "front-container-definition" {
  task_definition = "${aws_ecs_task_definition.front-app-cluster.id}"
  container_name = "front-app"
}*/

resource "aws_ecs_task_definition" "front-app-cluster" {
    family                = "front-app-cluster"
    container_definitions = <<DEFINITION
[
  {
    "ipcMode": null,
    "executionRoleArn": null,
    "containerDefinitions": [
      {
        "dnsSearchDomains": null,
        "environmentFiles": null,
        "logConfiguration": null,
        "entryPoint": null,
        "portMappings": [
          {
            "hostPort": 80,
            "protocol": "tcp",
            "containerPort": 80
          }
        ],
        "command": null,
        "linuxParameters": null,
        "cpu": 0,
        "environment": [
          {
            "name": "NODE_ENV",
            "value": "production"
          }
        ],
        "resourceRequirements": null,
        "ulimits": null,
        "dnsServers": null,
        "mountPoints": [],
        "workingDirectory": null,
        "secrets": null,
        "dockerSecurityOptions": null,
        "memory": null,
        "memoryReservation": 512,
        "volumesFrom": [],
        "stopTimeout": null,
        "image": "354793276020.dkr.ecr.us-east-1.amazonaws.com/front",
        "startTimeout": null,
        "firelensConfiguration": null,
        "dependsOn": null,
        "disableNetworking": null,
        "interactive": null,
        "healthCheck": null,
        "essential": true,
        "links": null,
        "hostname": null,
        "extraHosts": null,
        "pseudoTerminal": null,
        "user": null,
        "readonlyRootFilesystem": null,
        "dockerLabels": null,
        "systemControls": null,
        "privileged": null,
        "name": "front-app"
      }
    ],
    "placementConstraints": [],
    "memory": null,
    "taskRoleArn": null,
    "compatibilities": [
      "EC2"
    ],
    "taskDefinitionArn": "arn:aws:ecs:us-east-1:354793276020:task-definition/front-app-cluster:3",
    "family": "front-app-cluster",
    "requiresAttributes": [
      {
        "targetId": null,
        "targetType": null,
        "value": null,
        "name": "com.amazonaws.ecs.capability.ecr-auth"
      },
      {
        "targetId": null,
        "targetType": null,
        "value": null,
        "name": "com.amazonaws.ecs.capability.docker-remote-api.1.21"
      }
    ],
    "pidMode": null,
    "requiresCompatibilities": [
      "EC2"
    ],
    "networkMode": null,
    "cpu": null,
    "revision": 3,
    "status": "ACTIVE",
    "inferenceAccelerators": null,
    "proxyConfiguration": null,
    "volumes": []
  }
]
DEFINITION
}


/*data "aws_ecs_task_definition" "back-app-cluster" {
  task_definition = "${aws_ecs_task_definition.back-app-cluster.family}"
}

data "aws_ecs_container_definition" "backcontainer-definition" {
  task_definition = "${aws_ecs_task_definition.back-app-cluster.id}"
  container_name = "back-app"
}*/

resource "aws_ecs_task_definition" "back-app-cluster" {
    family                = "back-app-cluster"
    container_definitions = <<DEFINITION
[
  {
    "ipcMode": null,
    "executionRoleArn": null,
    "containerDefinitions": [
      {
        "dnsSearchDomains": null,
        "environmentFiles": null,
        "logConfiguration": null,
        "entryPoint": null,
        "portMappings": [
          {
            "hostPort": 80,
            "protocol": "tcp",
            "containerPort": 80
          }
        ],
        "command": null,
        "linuxParameters": null,
        "cpu": 0,
        "environment": [
          {
            "name": "NODE_ENV",
            "value": "production"
          }
        ],
        "resourceRequirements": null,
        "ulimits": null,
        "dnsServers": null,
        "mountPoints": [],
        "workingDirectory": null,
        "secrets": null,
        "dockerSecurityOptions": null,
        "memory": null,
        "memoryReservation": 512,
        "volumesFrom": [],
        "stopTimeout": null,
        "image": "354793276020.dkr.ecr.us-east-1.amazonaws.com/back",
        "startTimeout": null,
        "firelensConfiguration": null,
        "dependsOn": null,
        "disableNetworking": null,
        "interactive": null,
        "healthCheck": null,
        "essential": true,
        "links": null,
        "hostname": null,
        "extraHosts": null,
        "pseudoTerminal": null,
        "user": null,
        "readonlyRootFilesystem": null,
        "dockerLabels": null,
        "systemControls": null,
        "privileged": null,
        "name": "back-app-cluster"
      }
    ],
    "placementConstraints": [],
    "memory": null,
    "taskRoleArn": null,
    "compatibilities": [
      "EC2"
    ],
    "taskDefinitionArn": "arn:aws:ecs:us-east-1:354793276020:task-definition/back-app-cluster:1",
    "family": "back-app-cluster",
    "requiresAttributes": [
      {
        "targetId": null,
        "targetType": null,
        "value": null,
        "name": "com.amazonaws.ecs.capability.ecr-auth"
      },
      {
        "targetId": null,
        "targetType": null,
        "value": null,
        "name": "com.amazonaws.ecs.capability.docker-remote-api.1.21"
      }
    ],
    "pidMode": null,
    "requiresCompatibilities": [
      "EC2"
    ],
    "networkMode": null,
    "cpu": null,
    "revision": 1,
    "status": "ACTIVE",
    "inferenceAccelerators": null,
    "proxyConfiguration": null,
    "volumes": []
  }
]
DEFINITION
}
