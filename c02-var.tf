# Local variables
locals {
  name = "bus-app1-rgn"
  common_tags = {
    Owner       = "Tech-Grp"
    Environment = "Dev"
    Automation  = "Yes"
  }
}

# defining variables needed

variable "aws_region" {
  description = "Aws region for execution of the terraform script"
  type        = string
  default     = "ap-south-1"
}

#############################################################
## VPC variables
#############################################################
variable "vpc_cidr" {
  description = "Aws EC2 instance type"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "Aws EC2 instance type"
  type        = string
  default     = "t2.micro"
}

#############################################################
## EC2 variables
#############################################################
variable "private_instance_count" {
  description = "Count of private instances"
  type        = number
}

variable "ec2_iam_role" {
  description = "IAM role for the EC2 instance"
  type        = string
}

#############################################################
## EKS variables
#############################################################
variable "eks_instance_type" {
  description = "Aws EC2 instance type of EKS Nodes"
  type        = string
}

variable "eks_cluster_ver" {
  description = "Kubernetes cluster name of EKS"
  type        = string
}

variable "eks_node_disk_sz" {
  description = "EKS node disk size"
  type        = number
}