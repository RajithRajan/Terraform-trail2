################################################################################
# MongoDB Atlas
################################################################################

provider "mongodbatlas" {
  public_key  = var.mongodb_atlas_public_key
  private_key = var.mongodb_atlas_private_key
}

resource "mongodbatlas_project" "aws_atlas" {
  name   = "aws-atlas"
  org_id = var.mongodb_atlas_orgid
}

resource "mongodbatlas_cluster" "cluster-atlas" {
  project_id   = mongodbatlas_project.aws_atlas.id
  name         = "cluster-atlas"
  cluster_type = "REPLICASET"
  replication_specs {
    num_shards = 1
    regions_config {
      #region_name     = var.aws_region
      region_name     = "AP_SOUTH_1"
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }
  #cloud_backup                 = true
  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version       = "5.0"

  # Provider Settings "block"
  # provider_name               = "AWS"
  #  disk_size_gb                = 10
  # comment below 3 lines if instance is higher than M10
  backing_provider_name       = "AWS"
  provider_name               = "TENANT"
  provider_region_name        = "AP_SOUTH_1"
  provider_instance_size_name = var.mongodb_atlas_instance_type
}

resource "mongodbatlas_database_user" "db-user" {
  username           = var.mongodb_atlas_dbuser
  password           = var.mongodb_atlas_dbpassword
  auth_database_name = "admin"
  project_id         = mongodbatlas_project.aws_atlas.id
  roles {
    role_name     = "readWrite"
    database_name = "admin"
  }
  depends_on = [mongodbatlas_project.aws_atlas]
}
resource "mongodbatlas_network_container" "atlas_container" {
  atlas_cidr_block = var.mongodb_atlas_vpc_cidr
  project_id       = mongodbatlas_project.aws_atlas.id
  provider_name    = "AWS"
  #region_name      = var.aws_region
  region_name = "AP_SOUTH_1"
}

# tflint-ignore: terraform_unused_declarations
data "mongodbatlas_network_container" "atlas_container" {
  container_id = mongodbatlas_network_container.atlas_container.container_id
  project_id   = mongodbatlas_project.aws_atlas.id
}

resource "mongodbatlas_network_peering" "aws-atlas" {
  accepter_region_name   = var.aws_region
  project_id             = mongodbatlas_project.aws_atlas.id
  container_id           = mongodbatlas_network_container.atlas_container.container_id
  provider_name          = "AWS"
  route_table_cidr_block = module.vpc.vpc_cidr_block
  vpc_id                 = module.vpc.vpc_id
  aws_account_id         = data.aws_caller_identity.current.account_id
}

resource "mongodbatlas_project_ip_access_list" "test" {
  project_id = mongodbatlas_project.aws_atlas.id
  cidr_block = module.vpc.vpc_cidr_block
  comment    = "cidr block for AWS VPC"
}
