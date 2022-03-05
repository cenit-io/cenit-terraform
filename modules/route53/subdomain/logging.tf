resource "aws_cloudwatch_log_group" "aws_route53_subdomain" {
  count = var.enable_cloudwatch_logs ? 1 : 0
  name  = "/aws/route53/${aws_route53_zone.subdomain[0].name}"
  # retention_in_days = //TBC //TODO
}

resource "aws_cloudwatch_log_resource_policy" "route53-query-logging-policy" {
  count           = var.enable_cloudwatch_logs ? 1 : 0
  policy_document = data.aws_iam_policy_document.route53-query-logging-policy.json
  policy_name     = "route53-query-logging-policy"
}

resource "aws_route53_query_log" "this" {
  count      = var.enable_cloudwatch_logs ? 1 : 0
  depends_on = [aws_cloudwatch_log_resource_policy.route53-query-logging-policy]

  cloudwatch_log_group_arn = aws_cloudwatch_log_group.aws_route53_subdomain[0].arn
  zone_id                  = aws_route53_zone.subdomain[0].zone_id
}