output "vpc_id" {
  value = aws_vpc.ivolve.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_ids" {
  value = var.private_subnets[count.index]
}

output "ec2_instance_id" {
  value = aws_instance.web.id
}

output "rds_instance_ids" {
  value = [for k, db in aws_db_instance.db : db.id]
}
