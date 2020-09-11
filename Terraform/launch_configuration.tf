resource "aws_launch_configuration" "front-app-cluster-EcsInstanceLc" {
  associate_public_ip_address = "false"
  ebs_optimized               = "false"
  enable_monitoring           = "true"
  iam_instance_profile        = "ecsInstanceRole"
  image_id                    = "ami-0878e35d09c75f0a1"
  instance_type               = "t2.micro"
  key_name                    = "chaves"
  name                        = "front-app-cluster-EcsInstanceLc"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "0"
    volume_size           = "30"
    volume_type           = "gp2"
  }

  security_groups  = ["${aws_security_group.EcsInstanceLcFront.id}"]
  user_data_base64 = "IyEvYmluL2Jhc2gKZWNobyBFQ1NfQ0xVU1RFUj1mcm9udC1hcHAtY2x1c3RlciA+PiAvZXRjL2Vjcy9lY3MuY29uZmlnO2VjaG8gRUNTX0JBQ0tFTkRfSE9TVD0gPj4gL2V0Yy9lY3MvZWNzLmNvbmZpZzs="
}

resource "aws_launch_configuration" "back-app-cluster-EcsInstanceLc" {
  associate_public_ip_address = "false"
  ebs_optimized               = "false"
  enable_monitoring           = "true"
  iam_instance_profile        = "ecsInstanceRole"
  image_id                    = "ami-0878e35d09c75f0a1"
  instance_type               = "t2.micro"
  key_name                    = "chaves"
  name                        = "back-app-cluster-EcsInstanceLc"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "0"
    volume_size           = "30"
    volume_type           = "gp2"
  }

  security_groups  = ["${aws_security_group.EcsInstanceLcBack.id}"]
  user_data_base64 = "IyEvYmluL2Jhc2gKZWNobyBFQ1NfQ0xVU1RFUj1iYWNrLWFwcC1jbHVzdGVyID4+IC9ldGMvZWNzL2Vjcy5jb25maWc7ZWNobyBFQ1NfQkFDS0VORF9IT1NUPSA+PiAvZXRjL2Vjcy9lY3MuY29uZmlnOw=="
}
