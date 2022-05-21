# VPC Variables
vpc_cidr = "10.0.0.0/16"

# EC2 Variables
instance_type          = "t2.micro"
private_instance_count = 1
ec2_iam_role           = "EC2-role"

#EKS variable
#eks_instance_type      = "m5.large"
eks_instance_type = "t2.micro"
eks_cluster_ver   = "1.22"
#eks_node_disk_sz  = 50
eks_node_disk_sz  = 20


#Kafka variables
#kafka_instance_type = "kafka.t3.small"