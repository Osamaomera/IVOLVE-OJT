resource "aws_vpc" "ivolve-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    name = "ivolve-vpc"
  }
}

resource "aws_internet_gateway" "ivolve-igw" {
  vpc_id = aws_vpc.ivolve-vpc.id
  tags = {
    Name = "ivolve-igw"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.ivolve-vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = element(var.azs, 0)
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ivolve-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ivolve-igw.id
  }
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets)
  vpc_id     = aws_vpc.ivolve-vpc.id
  cidr_block = var.private_subnets[count.index]
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "private-subnet-${var.private_subnets[count.index]}"
  }
}

resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.ivolve-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.ivolve-vpc.id

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
