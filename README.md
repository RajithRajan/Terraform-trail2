# Terraform repo to create resources required for the project #

## Pre-requisite ##
- Download and configure AWS CLI https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-config
- Download terraform and add it in the path lib

## Steps to execute terraform project ##
- Clone the repo
- execute 

    `Terraform init`        This command is used to download all the dependency modules 

    `Terraform validate`    This command is used to validate the syntax

    `Terraform plan`        This command is used to create plan of updating the AWS environment to match the spec

    `Terraform apply`       This command is used to apply the changes to AWS, will require confirmation from user

- Execute below command to download the kubeconfig

`aws eks --region region update-kubeconfig --name cluster_name`

eg

`aws eks --region ap-south-1 update-kubeconfig --name bus-app1-rgn-eks-main`

- Kubeconfig would be downloaded so its ready to run kubectl against EKS    

- Before terminating the cluster clean up the services or ingress created so that the associated loadbalance are deleted.
- execute
    `Terraform destroy`    This command will delete all the AWS resources created by apply command

## Resources created by this script
- VPC spaning two AZs
- Public subnet
- Private subnet
- Database subnet
- Public security group
- Private security group
- Security group for EKS nodes for remote access
- Natgateway
- EC2 instance
- ALB
- EKS cluster with eks manage node group
- Managed Kafka cluster
- AWS Open search & Kibana dashboard
- Managed Database (RDS PostgreSQL)