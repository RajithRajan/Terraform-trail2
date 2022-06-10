# Terraform Output Values

####################################################
## VPC Output variables
####################################################

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = module.vpc.default_security_group_id
}

output "default_network_acl_id" {
  description = "The ID of the default network ACL"
  value       = module.vpc.default_network_acl_id
}

output "default_route_table_id" {
  description = "The ID of the default route table"
  value       = module.vpc.default_route_table_id
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = module.vpc.vpc_instance_tenancy
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = module.vpc.vpc_enable_dns_support
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = module.vpc.vpc_enable_dns_hostnames
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value       = module.vpc.vpc_main_route_table_id
}

output "vpc_ipv6_association_id" {
  description = "The association ID for the IPv6 CIDR block"
  value       = module.vpc.vpc_ipv6_association_id
}

output "vpc_ipv6_cidr_block" {
  description = "The IPv6 CIDR block"
  value       = module.vpc.vpc_ipv6_cidr_block
}

output "vpc_secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks of the VPC"
  value       = module.vpc.vpc_secondary_cidr_blocks
}

output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = module.vpc.vpc_owner_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.vpc.private_subnet_arns
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "private_subnets_ipv6_cidr_blocks" {
  description = "List of IPv6 cidr_blocks of private subnets in an IPv6 enabled VPC"
  value       = module.vpc.private_subnets_ipv6_cidr_blocks
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = module.vpc.public_subnet_arns
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = module.vpc.database_subnets
}

output "database_subnet_arns" {
  description = "List of ARNs of database subnets"
  value       = module.vpc.database_subnet_arns
}

output "database_subnets_cidr_blocks" {
  description = "List of cidr_blocks of database subnets"
  value       = module.vpc.database_subnets_cidr_blocks
}

output "database_subnet_group" {
  description = "ID of database subnet group"
  value       = module.vpc.database_subnet_group
}

output "database_subnet_group_name" {
  description = "Name of database subnet group"
  value       = module.vpc.database_subnet_group_name
}

####################################################
## Security group variables
####################################################

output "private-sg_security_group_id" {
  description = "The ID of the security group"
  value       = module.private-sg.security_group_id
}

output "private-sg_security_group_name" {
  description = "The name of the security group"
  value       = module.private-sg.security_group_name
}

output "public-sg_security_group_description" {
  description = "The description of the security group"
  value       = module.public-sg.security_group_description
}

output "public-sg_security_group_id" {
  description = "The ID of the security group"
  value       = module.public-sg.security_group_id
}

output "public-sg_security_group_name" {
  description = "The name of the security group"
  value       = module.public-sg.security_group_name
}

output "public-sgsecurity_group_description" {
  description = "The description of the security group"
  value       = module.public-sg.security_group_description
}

####################################################
## EC2 Variables
####################################################

output "ec2_private_id" {
  description = "The ID of the instance"
  value       = module.ec2_private[*].id
}

output "ec2_private_arn" {
  description = "The ARN of the instance"
  value       = module.ec2_private[*].arn
}

output "ec2_private_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_private[*].private_ip
}

output "ec2_private_private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_private[*].private_dns
}

####################################################
## ALB variables
####################################################

# output "lb_id" {
#   description = "The ID and ARN of the load balancer we created."
#   value       = module.alb.lb_id
# }

# output "lb_arn" {
#   description = "The ID and ARN of the load balancer we created."
#   value       = module.alb.lb_arn
# }

# output "lb_dns_name" {
#   description = "The DNS name of the load balancer."
#   value       = module.alb.lb_dns_name
# }

# output "lb_arn_suffix" {
#   description = "ARN suffix of our load balancer - can be used with CloudWatch."
#   value       = module.alb.lb_arn_suffix
# }

# output "lb_zone_id" {
#   description = "The zone_id of the load balancer to assist with creating DNS records."
#   value       = module.alb.lb_zone_id
# }

# output "http_tcp_listener_arns" {
#   description = "The ARN of the TCP and HTTP load balancer listeners created."
#   value       = module.alb.http_tcp_listener_arns
# }

# output "http_tcp_listener_ids" {
#   description = "The IDs of the TCP and HTTP load balancer listeners created."
#   value       = module.alb.http_tcp_listener_ids
# }

# output "https_listener_arns" {
#   description = "The ARNs of the HTTPS load balancer listeners created."
#   value       = module.alb.https_listener_arns
# }

# output "https_listener_ids" {
#   description = "The IDs of the load balancer listeners created."
#   value       = module.alb.https_listener_ids
# }

# output "target_group_arns" {
#   description = "ARNs of the target groups. Useful for passing to your Auto Scaling group."
#   value       = module.alb.target_group_arns
# }

# output "target_group_arn_suffixes" {
#   description = "ARN suffixes of our target groups - can be used with CloudWatch."
#   value       = module.alb.target_group_arn_suffixes
# }

# output "target_group_names" {
#   description = "Name of the target group. Useful for passing to your CodeDeploy Deployment Group."
#   value       = module.alb.target_group_names
# }

# output "target_group_attachments" {
#   description = "ARNs of the target group attachment IDs."
#   value       = module.alb.target_group_attachments
# }

####################################################
## EKS Variables
####################################################

output "cluster_id" {
  description = "EKS cluster ID."
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane."
  value       = module.eks.cluster_security_group_id
}

# output "kubectl_config" {
#   description = "kubectl config as generated by the module."
#   value       = module.eks.kubeconfig
# }

# output "config_map_aws_auth" {
#   description = "A kubernetes configuration to authenticate to this EKS cluster."
#   value       = module.eks.config_map_aws_auth
# }

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_id
}

####################################################
### MSK Output
####################################################

output "zookeeper_connect_string" {
  value = aws_msk_cluster.kafka_cluster.zookeeper_connect_string
}

output "bootstrap_brokers_tls" {
  description = "TLS connection host:port pairs"
  value       = aws_msk_cluster.kafka_cluster.bootstrap_brokers_tls
}

####################################################
### RDS Output
####################################################

output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.db.db_instance_address
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.db.db_instance_arn
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.db.db_instance_availability_zone
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.db.db_instance_endpoint
}

output "db_instance_engine" {
  description = "The database engine"
  value       = module.db.db_instance_engine
}

output "db_instance_engine_version_actual" {
  description = "The running version of the database"
  value       = module.db.db_instance_engine_version_actual
}

output "db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.db.db_instance_hosted_zone_id
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = module.db.db_instance_id
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.db.db_instance_resource_id
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = module.db.db_instance_status
}

output "db_instance_name" {
  description = "The database name"
  value       = module.db.db_instance_name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = module.db.db_instance_username
  sensitive   = true
}

output "db_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = module.db.db_instance_password
  sensitive   = true
}

output "db_instance_port" {
  description = "The database port"
  value       = module.db.db_instance_port
}

output "db_subnet_group_id" {
  description = "The db subnet group name"
  value       = module.db.db_subnet_group_id
}

output "db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = module.db.db_subnet_group_arn
}

output "db_parameter_group_id" {
  description = "The db parameter group id"
  value       = module.db.db_parameter_group_id
}

output "db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = module.db.db_parameter_group_arn
}

output "db_enhanced_monitoring_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the monitoring role"
  value       = module.db.enhanced_monitoring_iam_role_arn
}

output "db_instance_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value       = module.db.db_instance_cloudwatch_log_groups
}

# Default
output "db_default_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.db.db_instance_endpoint
}

output "db_default_instance_name" {
  description = "The database name"
  value       = module.db.db_instance_name
}

output "db_default_instance_username" {
  description = "The master username for the database"
  value       = module.db.db_instance_username
  sensitive   = true
}

output "db_default_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = module.db.db_instance_password
  sensitive   = true
}

output "db_default_instance_port" {
  description = "The database port"
  value       = module.db.db_instance_port
}
