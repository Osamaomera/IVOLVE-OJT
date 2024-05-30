resource "aws_db_instance" "db" {
  count = length(var.subnet_ids)

  identifier          = "db-${var.subnet_ids[count.index]}"
  engine              = "mysql"
  engine_version      = var.engine_version
  instance_class      = var.rds_instance_type
  allocated_storage   = 10
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.vpc_security_group_id]

  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "Main DB Subnet Group"
  }
}
