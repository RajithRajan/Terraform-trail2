terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 3.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}