output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = module.vpc.public_subnet_id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = module.vpc.private_subnet_ids
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2.ec2_instance_id
}

output "rds_instance_ids" {
  description = "The IDs of the RDS instances"
  value       = module.rds.rds_instance_ids
}
