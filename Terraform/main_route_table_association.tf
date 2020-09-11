resource "aws_main_route_table_association" "vpc-sre" {
  route_table_id = aws_route_table.rtb-sre.id
  vpc_id         = aws_vpc.vpc-sre.id
}
