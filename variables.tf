# AWS Region
variable "aws_region" {
  default = "us-east-1"
}

# CIDR block for the Virtual Private Cloud (VPC)
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

# List of CIDR blocks for public subnets in the VPC
variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

# List of CIDR blocks for private subnets in the VPC
variable "private_subnets" {
  type    = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

# Availability Zones to be used within the AWS region
variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
}
