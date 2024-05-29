output "rds_instance_ids" {
  value = [for r in aws_db_instance.db : r.id]
}
