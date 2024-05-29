variable "rds_instance_type" {
  description = "The RDS instance type"
}

variable "db_username" {
  description = "The database username"
}

variable "db_password" {
  description = "The database password"
}

variable "db_name" {
  description = "The database name"
}

variable "subnet_ids" {
  description = "The IDs of the subnets where RDS instances will be created"
  type        = list(string)
}

variable "vpc_security_group_id" {
  description = "The security group ID for the RDS instances"
}

variable "engine_version" {
  description = "The version of RDS mysql"
}