#############################################################################################
## Open Search defination
#############################################################################################

resource "aws_opensearch_domain" "opensearch" {
  domain_name    = var.opensearch_domain
  engine_version = "OpenSearch_1.0"
  count          = var.create_opensearch_domain ? 1 : 0

  cluster_config {
    instance_type          = var.opensearch_instance_type
    instance_count         = var.opensearch_instance_count
    zone_awareness_enabled = true
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 20
    volume_type = "gp2"
  }
  vpc_options {
    subnet_ids = module.vpc.private_subnets

    security_group_ids = [aws_security_group.opensearch-sg.id]
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  access_policies = <<CONFIG
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.opensearch_domain}/*"
        }
    ]
}
CONFIG

  tags = {
    Domain = "${var.opensearch_domain}"
  }

  depends_on = [aws_iam_service_linked_role.open_search_role]
}

