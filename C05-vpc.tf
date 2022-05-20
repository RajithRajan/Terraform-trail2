module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.name}-vpc"
  cidr = var.vpc_cidr

  azs              = ["${var.aws_region}a", "${var.aws_region}b"]
  private_subnets  = [cidrsubnet(var.vpc_cidr, 4, 0), cidrsubnet(var.vpc_cidr, 4, 7)]
  public_subnets   = [cidrsubnet(var.vpc_cidr, 4, 1), cidrsubnet(var.vpc_cidr, 4, 8)]
  database_subnets = [cidrsubnet(var.vpc_cidr, 4, 2), cidrsubnet(var.vpc_cidr, 4, 9)]

  create_database_subnet_group = false

  manage_default_network_acl = true
  default_network_acl_tags   = { Name = "${local.name}-dflt-acl" }

  manage_default_route_table = true
  default_route_table_tags   = { Name = "${local.name}-dflt-rt" }

  manage_default_security_group = true
  default_security_group_tags   = { Name = "${local.name}-dflt-sg" }

  enable_dns_hostnames = true
  enable_dns_support   = true

  #enable_classiclink             = true
  #enable_classiclink_dns_support = true

  enable_nat_gateway = true
  single_nat_gateway = true


  enable_dhcp_options      = true
  dhcp_options_domain_name = "service.consul"

  tags = local.common_tags
}


################################################################################
# Supporting Resources
################################################################################

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}