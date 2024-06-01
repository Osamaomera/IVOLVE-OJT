provider "aws" {
  region = var.region
  profile = "osama"
}

module "vpc" {
  source = "./modules/vpc"
  
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnets = var.private_subnets
  azs = var.azs
}

module "ec2" {
  source = "./modules/ec2"
  
  ami = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id = module.vpc.public_subnet_id
  vpc_security_group_id = module.vpc.ec2_sg_id
}

module "rds" {
  source = "./modules/rds"
  
  rds_instance_type = var.rds_instance_type
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  subnet_ids = module.vpc.private_subnet_ids
  vpc_security_group_id = module.vpc.rds_sg_id
  engine_version = var.engine_version
}
