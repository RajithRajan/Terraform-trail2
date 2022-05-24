# S3 Bucket configuration


# Used for the Kafka cluster logs
resource "aws_s3_bucket" "msk_broker_logs_bucket" {
  bucket = "${local.name}-msk-broker-logs-bucket"
}

resource "aws_s3_bucket_acl" "msk_broker_logs_bucket_acl" {
  bucket = aws_s3_bucket.msk_broker_logs_bucket.id
  acl    = "private"
}