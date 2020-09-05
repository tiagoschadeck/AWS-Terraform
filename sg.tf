resource "aws_security_group" "EcsInstanceLc-front-cluster-app" {
    name        = "EcsInstanceLc-front-cluster-app"
    description = "EcsInstanceLc-front-cluster-app"
    vpc_id              = aws_vpc.vpc-sre-challenge.id

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["10.0.0.0/23"]
    }

    ingress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        security_groups = []
        self            = true
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "EcsInstanceLc-back-cluster-app" {
    name        = "EcsInstanceLc-back-cluster-app"
    description = "EcsInstanceLc-back-cluster-app"
    vpc_id              = aws_vpc.vpc-sre-challenge.id

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["10.0.0.0/23", "10.0.10.0/23"]
    }

    ingress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        security_groups = []
        self            = true
    }

    ingress {
        from_port       = -1
        to_port         = -1
        protocol        = "icmp"
        cidr_blocks     = ["10.0.0.0/23"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "back-load-balancer" {
    name        = "back-load-balancer"
    description = "back-load-balancer"
    vpc_id              = aws_vpc.vpc-sre-challenge.id

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["10.0.0.0/23"]
    }

    ingress {
        from_port       = -1
        to_port         = -1
        protocol        = "icmp"
        cidr_blocks     = ["10.0.0.0/23"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "front-load-balancer" {
    name        = "front-load-balancer"
    description = "front-load-balancer"
    vpc_id              = aws_vpc.vpc-sre-challenge.id

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "MySQL" {
    name        = "MySQL"
    description = "MySQL"
    vpc_id              = aws_vpc.vpc-sre-challenge.id

    ingress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        security_groups = []
        self            = true
    }

    ingress {
        from_port       = 3306
        to_port         = 3306
        protocol        = "tcp"
        cidr_blocks     = ["10.0.10.0/23"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

}
