resource "aws_route_table" "rtb-sre-challenge" {
  vpc_id           = aws_vpc.vpc-sre-challenge.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}
