/*
resource "aws_lb_target_group_attachment" "front-app-cluster" {
  target_group_arn = aws_lb_target_group.front-app-cluster.arn
  target_id        = aws_instance.front-app-cluster-EcsInstanceAsg.id
}

resource "aws_lb_target_group_attachment" "back-app-cluster" {
  target_group_arn = aws_lb_target_group.back-app-cluster.arn
  target_id        = aws_instance.back-app-cluster-EcsInstanceAsg.id
}
*/
