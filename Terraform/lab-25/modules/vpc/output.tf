output "vpc_id" {
  value = aws_vpc.ivolve-vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_ids" {
  value = [for s in aws_subnet.private : s.id]
}

output "ec2_sg_id" {
  value = aws_security_group.ec2_sg.id
}

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}
