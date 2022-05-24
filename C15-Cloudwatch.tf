# Cloundwatch configurations

resource "aws_cloudwatch_log_group" "msk_broker_logs" {
  name = "${local.name}-msk-broker-logs"
}


resource "aws_cloudwatch_log_group" "auth_app_logs" {
  name = "${local.name}-auth-app-logs"
}