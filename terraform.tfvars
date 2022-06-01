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
eks_node_disk_sz = 20


#Kafka variables
#kafka_instance_type = "kafka.m5.large"
kafka_instance_type = "kafka.t3.small"
#kafka_storage_sz  = 1000
kafka_storage_sz = 20

#Opensearch variables
opensearch_domain        = "my-opensearch"
opensearch_instance_type = "t3.small.search"
#opensearch_instance_type = "m4.large.search"
opensearch_instance_count = 2

#Database variables
db_instance_type = "db.t3.micro"
#db_instance_type     = "db.t4g.large"
db_alloc_storage     = 20
db_max_alloc_storage = 100
db_multi_az_flag     = false
