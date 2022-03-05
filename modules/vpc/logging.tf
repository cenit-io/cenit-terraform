resource "aws_flow_log" "vpc" {
  count           = var.enable_cloudwatch_logs ? 1 : 0
  iam_role_arn    = aws_iam_role.vpc_logs_role[0].arn
  log_destination = aws_cloudwatch_log_group.vpc_log_group[0].arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.this.id
}

resource "aws_cloudwatch_log_group" "vpc_log_group" {
  count = var.enable_cloudwatch_logs ? 1 : 0
  name  = "/aws/vpc/${var.environment}-vpc-logs"
  #retention = TBC
}

resource "aws_iam_role" "vpc_logs_role" {
  count = var.enable_cloudwatch_logs ? 1 : 0
  name  = "${var.environment}-vpc-logs"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}