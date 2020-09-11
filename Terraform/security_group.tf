resource "aws_security_group" "EcsInstanceLcBack" {
  description = "EcsInstanceLc-back-cluster-app"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["10.0.0.0/23", "10.0.10.0/23"]
    //cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  ingress {
    cidr_blocks = ["10.0.0.0/23"]
    from_port   = "-1"
    protocol    = "icmp"
    self        = "false"
    to_port     = "-1"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "EcsInstanceLc-back-cluster-app"
  vpc_id = aws_vpc.vpc-sre.id
}

resource "aws_security_group" "EcsInstanceLcFront" {
  description = "EcsInstanceLc-front-cluster-app"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  ingress {
    cidr_blocks = ["10.0.0.0/23"]
    //cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "EcsInstanceLc-front-cluster-app"
  vpc_id = aws_vpc.vpc-sre.id
}

resource "aws_security_group" "MySQL" {
  description = "MySQL"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  # Remover "0.0.0.0/0" após executar o script de criação da tabela
  ingress {
    //cidr_blocks = ["10.0.10.0/23"]
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "3306"
    protocol    = "tcp"
    self        = "false"
    to_port     = "3306"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "MySQL"
  vpc_id = aws_vpc.vpc-sre.id
}

resource "aws_security_group" "elb-back" {
  description = "back-load-balancer"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  /*ingress {
    cidr_blocks = ["10.0.0.0/23"]
    from_port   = "-1"
    protocol    = "icmp"
    self        = "false"
    to_port     = "-1"
  }*/

  ingress {
    //cidr_blocks = [10.0.0.0/23"]
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  name   = "back-load-balancer"
  vpc_id = aws_vpc.vpc-sre.id
}

resource "aws_security_group" "alb-front" {
  description = "front-load-balancer"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  name   = "front-load-balancer"
  vpc_id = aws_vpc.vpc-sre.id
}
