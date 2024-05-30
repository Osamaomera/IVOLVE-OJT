variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
}

variable "private_subnets" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
}

variable "azs" {
  description = "List of Availability Zones"
  type        = list(string)
}
