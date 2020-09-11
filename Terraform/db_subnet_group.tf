resource "aws_db_subnet_group" "db-subnet-group" {
  description = "db-subnet-group"
  name        = "db-subnet-group"
  subnet_ids  = [aws_subnet.subnet-db-a.id,aws_subnet.subnet-db-b.id]
}
