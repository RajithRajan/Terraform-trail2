# Cloundwatch configurations

resource "aws_cloudwatch_log_group" "msk_broker_logs" {
  name              = "${local.name}-msk-broker-logs"
  retention_in_days = 90
}


resource "aws_cloudwatch_log_group" "auth_app_logs" {
  name              = "${local.name}-auth-app-logs"
  retention_in_days = 90
}

# // intended for application logs (access logs, modsec, etc.)
# resource "aws_cloudwatch_log_group" "test-app-loggroup" {
#   name              = "test-app"
#   retention_in_days = 90
# }

# resource "aws_security_group" "cloudwatch-sumologic-lambda-sg" {
#   name = "cloudwatch-sumologic-lambda-sg"

#   tags {
#     Name = "cloudwatch-sumologic-lambda-sg"
#   }

#   description = "Security group for lambda to move logs from CWL to SumoLogic"
#   vpc_id      = "${aws_vpc.dev-vpc.id}"
# }

# resource "aws_security_group_rule" "https-egress-cloudwatch-sumologic-to-internet" {
#   type              = "egress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#   security_group_id = "${aws_security_group.cloudwatch-sumologic-lambda-sg.id}"
#   cidr_blocks       = ["0.0.0.0/0"]
# }

# resource "aws_iam_role" "test-cloudwatch-lambda-role" {
#   name = "test-cloudwatch-lambda-role"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "lambda.amazonaws.com"
#       },
#       "Effect": "Allow"
#     }
#   ]
# }
# EOF
# }

# resource "aws_iam_role_policy" "test-cloudwatch-lambda-policy" {
#   name = "test-cloudwatch-lambda-policy"
#   role = "${aws_iam_role.test-cloudwatch-lambda-role.id}"

#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "CopiedFromTemplateAWSLambdaVPCAccessExecutionRole1",
#       "Effect": "Allow",
#       "Action": [
#         "ec2:CreateNetworkInterface"
#       ],
#       "Resource": "*"
#     },
#     {
#       "Sid": "CopiedFromTemplateAWSLambdaVPCAccessExecutionRole2",
#       "Effect": "Allow",
#       "Action": [
#         "ec2:DescribeNetworkInterfaces",
#         "ec2:DeleteNetworkInterface"
#       ],
#       "Resource": "arn:aws:ec2:ap-southeast-2:${var.dev_vpc_account_id}:network-interface/*"
#     },

#     {
#       "Sid": "CopiedFromTemplateAWSLambdaBasicExecutionRole1",
#       "Effect": "Allow",
#       "Action": "logs:CreateLogGroup",
#       "Resource": "arn:aws:logs:ap-southeast-2:${var.dev_vpc_account_id}:*"
#     },
#     {
#       "Sid": "CopiedFromTemplateAWSLambdaBasicExecutionRole2",
#       "Effect": "Allow",
#       "Action": [
#         "logs:CreateLogStream",
#         "logs:PutLogEvents"
#       ],
#       "Resource": [
#     "arn:aws:logs:ap-southeast-2:${var.dev_vpc_account_id}:log-group:/aws/lambda/*"
#       ]
#     },

#     {
#       "Sid": "CopiedFromTemplateAWSLambdaAMIExecutionRole",
#       "Effect": "Allow",
#       "Action": [
#          "ec2:DescribeImages"
#       ],
#       "Resource": "*"
#     }


#   ]
# }
# EOF
# }

# resource "aws_lambda_function" "cloudwatch-sumologic-lambda" {
#   function_name    = "cloudwatch-sumologic-lambda"
#   filename         = "${var.lambda_dir}/cloudwatchSumologicLambda.zip"
#   source_code_hash = "${base64sha256(file("${var.lambda_dir}/cloudwatchSumologicLambda.zip"))}"
#   handler          = "cloudwatchSumologic.handler"

#   role        = "${aws_iam_role.test-cloudwatch-lambda-role.arn}"
#   memory_size = "128"
#   runtime     = "nodejs4.3"

#   // set low because I'm concerned about cost-blowout in the case of mis-configuration
#   timeout = "15"

#   vpc_config = {
#     subnet_ids         = ["${aws_subnet.dev-private-subnet.id}"]
#     security_group_ids = ["${aws_security_group.cloudwatch-sumologic-lambda-sg.id}"]
#   }
# }

# resource "aws_lambda_permission" "test-app-allow-cloudwatch" {
#   statement_id  = "test-app-allow-cloudwatch"
#   action        = "lambda:InvokeFunction"
#   function_name = "${aws_lambda_function.cloudwatch-sumologic-lambda.arn}"
#   principal     = "logs.ap-southeast-2.amazonaws.com"
#   source_arn    = "${aws_cloudwatch_log_group.test-app-loggroup.arn}"
# }

# resource "aws_cloudwatch_log_subscription_filter" "test-app-cloudwatch-sumologic-lambda-subscription" {
#   depends_on      = ["aws_lambda_permission.test-app-allow-cloudwatch"]
#   name            = "cloudwatch-sumologic-lambda-subscription"
#   log_group_name  = "${aws_cloudwatch_log_group.test-app-loggroup.name}"
#   filter_pattern  = ""
#   destination_arn = "${aws_lambda_function.cloudwatch-sumologic-lambda.arn}"
# }