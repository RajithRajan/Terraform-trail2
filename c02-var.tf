# Local variables
locals {
  name = "abccorp-auth-rgn"
  common_tags = {
    Owner       = "Tech-Grp"
    Environment = var.env
    Automation  = "Yes"
  }
}

# defining variables needed

variable "aws_region" {
  description = "Aws region for execution of the terraform script"
  type        = string
  default     = "ap-south-1"
}

variable "env" {
  description = "Environment which needs to be provisioned"
  type        = string
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

# variable "ec2_iam_role" {
#   description = "IAM role for the EC2 instance"
#   type        = string
# }

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

#############################################################
## Kafka variables
#############################################################
variable "kafka_instance_type" {
  description = "Aws EC2 instance type for Kafka Nodes"
  type        = string
}

variable "kafka_storage_sz" {
  description = "Kafka node disk size"
  type        = number
}

variable "create_kafka_cluster" {
  type        = bool
  description = "Create kafka cluster"
}
#############################################################
## OpenSearch variables
#############################################################
variable "opensearch_domain" {
  description = "Domain name for the Opensearch"
  type        = string
}

variable "opensearch_instance_type" {
  description = "Aws EC2 instance type for opensearch Nodes"
  type        = string
}

variable "opensearch_instance_count" {
  description = "Count of opensearch instances"
  type        = number
}

variable "create_opensearch_domain" {
  type        = bool
  description = "Create Opensearch domain"
}
#############################################################
## Database variables
#############################################################

variable "db_instance_type" {
  description = "Aws EC2 instance type for database"
  type        = string
}

variable "db_alloc_storage" {
  description = "Allocated storage for Database"
  type        = number
}

variable "db_max_alloc_storage" {
  description = "Max allocated storage for Database"
  type        = number
}

variable "db_multi_az_flag" {
  description = "Does Database need Multi AZ implementation"
  type        = bool
}

variable "enabled_ssm_parameter_store" {
  type        = bool
  default     = true
  description = "Save RDS credentials to SSM Parameter Store."
}

variable "db_initial_db_name" {
  type        = string
  default     = "demodb"
  description = "Provide the name of Database which needs to be created initially"
}