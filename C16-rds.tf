################################################################################
# RDS Module
################################################################################

module "db" {
  source             = "terraform-aws-modules/rds/aws"
  version            = "4.4.0"
  create_db_instance = var.create_rds_db

  identifier = local.name

  # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  engine               = "postgres"
  engine_version       = "14.1"
  family               = "postgres14" # DB parameter group
  major_engine_version = "14"         # DB option group
  instance_class       = var.db_instance_type

  allocated_storage     = var.db_alloc_storage
  max_allocated_storage = var.db_max_alloc_storage

  db_name  = var.db_initial_db_name
  username = "admin_postgresql"
  port     = 5432

  multi_az               = var.db_multi_az_flag
  db_subnet_group_name   = module.vpc.database_subnet_group
  vpc_security_group_ids = [module.db-sg.security_group_id]

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  create_cloudwatch_log_group     = true

  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_interval                   = 60
  monitoring_role_name                  = "db-monitoring-role"
  monitoring_role_description           = "Role to monitor DB"

  parameters = [
    {
      name  = "autovacuum"
      value = 1
    },
    {
      name  = "client_encoding"
      value = "utf8"
    }
  ]

  tags = merge(
    local.common_tags,
    {
      type = "RDS"
    }
  )
  db_option_group_tags = {
    "Sensitive" = "low"
  }
  db_parameter_group_tags = {
    "Sensitive" = "low"
  }
}

resource "aws_ssm_parameter" "db_postgres_ssm_parameter_password" {
  count = var.enabled_ssm_parameter_store ? 1 : 0

  name  = "/database/${var.env}/password/master"
  value = module.db.db_instance_password
  type  = "SecureString"
  tags = merge(
    local.common_tags,
    {
      type = "SSM_PARAM_RDS_PWD"
    }
  )
  overwrite = true
}

resource "aws_ssm_parameter" "db_postgres_ssm_parameter_endpoint" {
  count = var.enabled_ssm_parameter_store ? 1 : 0

  name  = "/database/${var.env}/endpoint"
  value = module.db.db_instance_endpoint
  type  = "String"
  tags = merge(
    local.common_tags,
    {
      type = "SSM_PARAM_RDS_endpoint"
    }
  )
  overwrite = true
}