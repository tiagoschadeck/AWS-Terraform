/* SSH key pair */
/*resource "aws_key_pair" "chaves" {
  key_name   = "chaves"
  public_key = "chaves"
}*/

resource "aws_ecs_cluster" "front-cluster-app" {
  name = "front-cluster-app"
}

resource "aws_ecs_service" "front-service" {
  	name            = "front-service"
  	//iam_role        = "${aws_iam_role.ecs-service-role.name}"
  	cluster         = aws_ecs_cluster.front-cluster-app.id
    task_definition = aws_ecs_task_definition.front-app-cluster.arn
    //"${aws_ecs_task_definition.front-app-cluster.family}:${max("${aws_ecs_task_definition.front-app-cluster.revision}", "${data.aws_ecs_task_definition.front-app-cluster.revision}")}"
  	desired_count   = 2

  	load_balancer {
    	target_group_arn  = aws_alb_target_group.front-target-group.arn
    	container_port    = 80
    	container_name    = "front"
	}
}



resource "aws_ecs_cluster" "back-cluster-app" {
  name = "back-cluster-app"
}

resource "aws_ecs_service" "back-service" {
  	name            = "back-service"
  	//iam_role        = "${aws_iam_role.ecs-service-role.name}"
  	cluster         = aws_ecs_cluster.back-cluster-app.id
  	task_definition = aws_ecs_task_definition.back-app-cluster.arn
    //"${aws_ecs_task_definition.back-app-cluster.family}:${max("${aws_ecs_task_definition.back-app-cluster.revision}", "${data.aws_ecs_task_definition.back-app-cluster.revision}")}"
  	desired_count   = 2

  	load_balancer {
    	elb_name          = "back-elb"
    	container_port    = 80
    	container_name    = "back"
	}
}
