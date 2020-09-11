resource "aws_subnet" "subnet-front-a" {
  assign_ipv6_address_on_creation = "false"
  cidr_block                      = "10.0.0.0/24"
  map_public_ip_on_launch         = "true"
  vpc_id                          = aws_vpc.vpc-sre.id
  availability_zone               = "us-east-1a"
}

resource "aws_subnet" "subnet-front-b" {
  assign_ipv6_address_on_creation = "false"
  cidr_block                      = "10.0.1.0/24"
  map_public_ip_on_launch         = "true"
  vpc_id                          = aws_vpc.vpc-sre.id
  availability_zone               = "us-east-1b"
}

resource "aws_subnet" "subnet-back-a" {
  assign_ipv6_address_on_creation = "false"
  cidr_block                      = "10.0.10.0/24"
  map_public_ip_on_launch         = "true"
  vpc_id                          = aws_vpc.vpc-sre.id
  availability_zone               = "us-east-1a"
}

resource "aws_subnet" "subnet-back-b" {
  assign_ipv6_address_on_creation = "false"
  cidr_block                      = "10.0.11.0/24"
  map_public_ip_on_launch         = "true"
  vpc_id                          = aws_vpc.vpc-sre.id
  availability_zone               = "us-east-1b"
}

resource "aws_subnet" "subnet-db-a" {
  assign_ipv6_address_on_creation = "false"
  cidr_block                      = "10.0.20.0/24"
  map_public_ip_on_launch         = "false"
  vpc_id                          = aws_vpc.vpc-sre.id
  availability_zone               = "us-east-1a"
}

resource "aws_subnet" "subnet-db-b" {
  assign_ipv6_address_on_creation = "false"
  cidr_block                      = "10.0.21.0/24"
  map_public_ip_on_launch         = "false"
  vpc_id                          = aws_vpc.vpc-sre.id
  availability_zone               = "us-east-1b"
}
