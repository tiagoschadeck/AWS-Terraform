resource "aws_launch_template" "back-app-template" {
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = "true"
      encrypted             = "false"
      iops                  = "0"
      volume_size           = "30"
      volume_type           = "standard"
    }
  }

  default_version         = "1"
  disable_api_termination = "false"
  ebs_optimized           = "true"
  image_id                = "ami-0e2efdaddecea9838"
  instance_type           = "t2.micro"

  monitoring {
    enabled = "true"
  }

  name = "back-app-template"

  network_interfaces {
    associate_public_ip_address = "false"
    delete_on_termination       = "true"
    device_index                = "0"
    ipv4_address_count          = "0"
    ipv6_address_count          = "0"
    security_groups             = ["aws_security_group.EcsInstanceLcBack.id"]
  }
}

resource "aws_launch_template" "front-app-template" {
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = "true"
      encrypted             = "false"
      iops                  = "0"
      volume_size           = "30"
      volume_type           = "standard"
    }
  }

  default_version         = "1"
  disable_api_termination = "false"
  ebs_optimized           = "true"
  image_id                = "ami-0e2efdaddecea9838"
  instance_type           = "t2.micro"

  monitoring {
    enabled = "true"
  }

  name = "front-app-template"

  network_interfaces {
    associate_public_ip_address = "false"
    delete_on_termination       = "true"
    device_index                = "0"
    ipv4_address_count          = "0"
    ipv6_address_count          = "0"
    security_groups             = ["aws_security_group.EcsInstanceLcFront.id"]
  }
}
