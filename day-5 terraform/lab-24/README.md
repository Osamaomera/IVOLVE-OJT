# Multi-Tier Application Deployment with Terraform

This project uses Terraform to define and deploy a multi-tier architecture on AWS, including a VPC, subnets, an EC2 instance, and an RDS database. The architecture includes one public subnet for the EC2 instance and two private subnets for the RDS database.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS account
- AWS credentials configured (either through environment variables, AWS CLI, or IAM role)

## Architecture

- **VPC**: A virtual private cloud to house the entire infrastructure.
- **Subnets**: One public subnet for the EC2 instance and two private subnets for the RDS database.
- **EC2 Instance**: A web server running in the public subnet.
- **RDS Database**: Two MySQL databases running in the private subnets.

## Project Structure

- `variables.tf`: Defines all the variables used in the project.
- `provider.tf`: Configures the AWS provider.
- `vpc.tf`: Creates the VPC and subnets.
- `security_groups.tf`: Creates security groups for the EC2 instance and RDS database.
- `ec2.tf`: Creates the EC2 instance.
- `rds.tf`: Creates the RDS instances and subnet group.
- `outputs.tf`: Defines the outputs for the infrastructure.

## Usage

1. **Clone the repository**:
   ```sh
   git clone https://github.com/osamaomera/!!!.git
   cd your-repo-name

2. **Initialize Terraform**:
    ```sh
   terraform init