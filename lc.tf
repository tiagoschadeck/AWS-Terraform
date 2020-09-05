resource "aws_launch_configuration" "EcsInstanceLc-front-cluster-app" {
    name                        = "EcsInstanceLc-front-cluster-app"
    image_id                    = "ami-02f5ea673e84393c9"
    instance_type               = "t2.micro"
    //iam_instance_profile        = "arn:aws:iam::354793276020:instance-profile/ecsInstanceRole"
    key_name                    = "chaves"
    security_groups             = [aws_security_group.EcsInstanceLc-front-cluster-app.id]
    user_data                   = "IyEvYmluL2Jhc2gKZWNobyBFQ1NfQ0xVU1RFUj1mcm9udC1jbHVzdGVyLWFwcCA+PiAvZXRjL2Vjcy9lY3MuY29uZmlnO2VjaG8gRUNTX0JBQ0tFTkRfSE9TVD0gPj4gL2V0Yy9lY3MvZWNzLmNvbmZpZzs="
    enable_monitoring           = true
    ebs_optimized               = false

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 30
        delete_on_termination = true
    }

}


resource "aws_launch_configuration" "EcsInstanceLc-back-cluster-app" {
    name                        = "EcsInstanceLc-back-cluster-app"
    image_id                    = "ami-02f5ea673e84393c9"
    instance_type               = "t2.micro"
    //iam_instance_profile        = "arn:aws:iam::354793276020:instance-profile/ecsInstanceRole"
    key_name                    = "chaves"
    security_groups             = [aws_security_group.EcsInstanceLc-back-cluster-app.id]
    user_data                   = "IyEvYmluL2Jhc2gKZWNobyBFQ1NfQ0xVU1RFUj1iYWNrLWNsdXN0ZXItYXBwID4+IC9ldGMvZWNzL2Vjcy5jb25maWc7ZWNobyBFQ1NfQkFDS0VORF9IT1NUPSA+PiAvZXRjL2Vjcy9lY3MuY29uZmlnOw=="
    enable_monitoring           = true
    ebs_optimized               = false

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 30
        delete_on_termination = true
    }

}
