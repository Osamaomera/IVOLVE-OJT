variable "ami" {
  description = "The AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "The EC2 instance type"
}

variable "subnet_id" {
  description = "The subnet ID for the EC2 instance"
}

variable "vpc_security_group_id" {
  description = "The security group ID for the EC2 instance"
}
