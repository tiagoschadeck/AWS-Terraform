resource "aws_route_table" "rtb-sre" {
  vpc_id = aws_vpc.vpc-sre.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
  }
}
