resource "aws_db_instance" "ser-challenge" {
    identifier                = "db-sre-challenge"
    allocated_storage         = 20
    storage_type              = "gp2"
    engine                    = "mysql"
    engine_version            = "5.7.16"
    instance_class            = "db.t2.micro"
    name                      = ""
    username                  = "admin"
    password                  = "tA909YlVDXOQTfaERTOK"
    port                      = 3306
    publicly_accessible       = false
    availability_zone         = "us-east-1a"
    security_group_names      = []
    vpc_security_group_ids    = [aws_security_group.MySQL.id]
    db_subnet_group_name      = "db-subnet-group"
    parameter_group_name      = "default.mysql5.7"
    multi_az                  = false
    backup_retention_period   = 7
    backup_window             = "00:00-02:00"
    maintenance_window        = "sun:02:00-sun:04:00"
    final_snapshot_identifier = "db-sre-challenge-final"
}

resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.db-subnet-a.id,aws_subnet.db-subnet-b.id]
}
