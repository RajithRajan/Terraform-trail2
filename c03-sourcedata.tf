# Extracting data from aws

# Extracting the AMI details of amazon linux 2
data "aws_ami" "amzlinux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-x86_64-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

# Extract the details of the availability zones in the region
data "aws_availability_zones" "azs" {
  state = "available"
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}