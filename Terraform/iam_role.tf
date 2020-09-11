resource "aws_iam_role" "ecsServiceRole" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs.amazonaws.com"
      },
      "Sid": ""
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  max_session_duration = "3600"
  name                 = "ecsServiceRole"
  path                 = "/"
}
