resource "aws_internet_gateway" "igw" {
  tags = {
    Name = "igw"
  }

  vpc_id = aws_vpc.vpc-sre.id
}
