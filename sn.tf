resource "aws_subnet" "front-subnet-a" {
  vpc_id                  = aws_vpc.vpc-sre-challenge.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "front-subnet-b" {
  vpc_id                  = aws_vpc.vpc-sre-challenge.id
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "back-subnet-a" {
  vpc_id                  = aws_vpc.vpc-sre-challenge.id
    cidr_block              = "10.0.10.0/24"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "back-subnet-b" {
  vpc_id                  = aws_vpc.vpc-sre-challenge.id
    cidr_block              = "10.0.11.0/24"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "db-subnet-a" {
  vpc_id                  = aws_vpc.vpc-sre-challenge.id
    cidr_block              = "10.0.20.0/24"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = false
}

resource "aws_subnet" "db-subnet-b" {
  vpc_id                  = aws_vpc.vpc-sre-challenge.id
    cidr_block              = "10.0.21.0/24"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = false
}
