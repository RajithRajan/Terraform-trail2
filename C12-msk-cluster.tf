#############################################################################################
## MSK cluster defination 
#############################################################################################

resource "aws_msk_cluster" "kafka_cluster" {
  cluster_name           = "${local.name}-kafka-cluster"
  kafka_version          = "2.8.1"
  number_of_broker_nodes = 2
  count                  = var.create_kafka_cluster ? 1 : 0

  broker_node_group_info {
    instance_type   = var.kafka_instance_type
    client_subnets  = module.vpc.private_subnets
    ebs_volume_size = var.kafka_storage_sz
    security_groups = [module.private-sg.security_group_id]
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.kafka_kms_key.arn
  }

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = true
      }
      node_exporter {
        enabled_in_broker = true
      }
    }
  }

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = true
        log_group = aws_cloudwatch_log_group.msk_broker_logs.name
      }
      firehose {
        enabled = false
        # delivery_stream = aws_kinesis_firehose_delivery_stream.test_stream.name
      }
      s3 {
        enabled = true
        bucket  = aws_s3_bucket.msk_broker_logs_bucket.id
        prefix  = "logs/msk-"
      }
    }
  }

  tags = merge(
    local.common_tags,
    {
      type = "msk/kafka  cluster"
    }
  )
}
