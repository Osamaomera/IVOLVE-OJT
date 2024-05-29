resource "aws_db_instance" "db" {
  
  for_each = var.private_subnets

  identifier          = "db-${each.key}"
  engine              = "mysql"
  engine_version      = var.db_engine_version
  instance_class      = var.rds_instance_type
  allocated_storage   = 10
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = [for s in aws_subnet.private_subnet : s.id]

  tags = {
    Name = "Main DB Subnet Group"
  }
}

resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.ivolve.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
