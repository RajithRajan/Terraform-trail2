# Common variable
env = "dev"
# Region variable
aws_region = "ap-south-1"

# VPC Variables
vpc_cidr = "10.0.0.0/16"

# EC2 Variables
instance_type          = "t2.micro"
private_instance_count = 1
#ec2_iam_role           = "EC2-role"

#EKS variable
#eks_instance_type      = "m5.large"
eks_instance_type = "t2.micro"
eks_cluster_ver   = "1.22"
#eks_node_disk_sz  = 50
eks_node_disk_sz   = 20
create_eks_cluster = false


#Kafka variables
#kafka_instance_type = "kafka.m5.large"
kafka_instance_type = "kafka.t3.small"
#kafka_storage_sz  = 1000
kafka_storage_sz     = 20
create_kafka_cluster = false

#Opensearch variables
opensearch_domain        = "my-opensearch"
opensearch_instance_type = "t3.small.search"
#opensearch_instance_type = "m4.large.search"
opensearch_instance_count = 2
create_opensearch_domain  = false

#Database variables
db_instance_type = "db.t3.micro"
#db_instance_type     = "db.t4g.large"
db_alloc_storage            = 20
db_max_alloc_storage        = 100
db_multi_az_flag            = false
db_initial_db_name          = "quarkus_test"
create_rds_db               = false
enabled_ssm_parameter_store = false

#MongoDB atlas variable
mongodb_atlas_instance_type = "M0"
#mongodb_atlas_instance_type = "M10"
#mongodb_atlas_public_key set as environment variable TF_VAR_mongodb_atlas_public_key
#mongodb_atlas_private_key set as environment variable TF_VAR_mongodb_atlas_private_key
mongodb_atlas_dbuser     = "authappuser"
mongodb_atlas_dbpassword = "authappp@$$word"
#mongodb_atlas_orgid set as environment variable TF_VAR_mongodb_atlas_orgid
mongodb_atlas_vpc_cidr = "192.168.232.0/21"