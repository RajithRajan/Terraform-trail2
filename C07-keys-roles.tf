resource "aws_kms_key" "eks" {
  description             = "EKS Secret Encryption Key"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = merge(
    local.common_tags,
    {
      type = "aws-kms-key"
    }
  )
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "aws_key_pair" "this" {
  key_name_prefix = local.name
  public_key      = tls_private_key.this.public_key_openssh

  tags = merge(
    local.common_tags,
    {
      type = "aws-key-pair"
    }
  )
}

resource "aws_iam_instance_profile" "ec2-ins-prof-ssm" {
  name = "ec2-ins-prof-ssm"
  role = aws_iam_role.ec2-role-ssm.id
}

resource "aws_iam_role" "ec2-role-ssm" {
  name                = "ec2-role-ssm"
  path               = "/"
  assume_role_policy = <<EOL
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": ["ec2.amazonaws.com"]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOL

  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM",
                         "arn:aws:iam::aws:policy/AmazonS3FullAccess",
                         "arn:aws:iam::aws:policy/AmazonSSMFullAccess",
                         "arn:aws:iam::aws:policy/AmazonS3OutpostsFullAccess"]


}