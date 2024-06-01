variable "region" {
  description = "The AWS region to deploy in"
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  default = "10.0.1.0/24"
}

variable "private_subnets" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
  default = [ "10.0.2.0/24" , "10.0.3.0/24" ]
}

variable "azs" {
  description = "List of Availability Zones"
  type        = list(string)
  default = [ "us-east-1a", "us-east-1b" ]
}

variable "ec2_ami" {
  description = "The AMI ID for the EC2 instance"
  default = "ami-00beae93a2d981137"
}

variable "ec2_instance_type" {
  description = "The EC2 instance type"
  default = "t2.micro"
}

variable "rds_instance_type" {
  description = "The RDS instance type"
  default = "db.t3.micro"
}

variable "db_username" {
  description = "The database username"
  default = "admin"
}

variable "db_password" {
  description = "The database password"
  default = "password"
}

variable "db_name" {
  description = "The database name"
  default = "mydb"
}

variable "engine_version" {
  description = "The version of RDS mysql"
  default = "8.0"
}