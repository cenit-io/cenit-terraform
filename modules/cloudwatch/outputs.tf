output "aws_cloudwatch_dashboard_eks_cluster_id" {
  value = var.enable_eks_metrics ? aws_cloudwatch_dashboard.eks_cluster_metrics[0].id : null
}

output "aws_cloudwatch_dashboard_elb_metrics_id" {
  value = var.enable_elb_metrics ? aws_cloudwatch_dashboard.elb_metrics[0].id : null
}

output "aws_cloudwatch_dashboard_lambdas_metrics_id" {
  value = var.enable_lambda_metrics ? aws_cloudwatch_dashboard.lambda_metrics[0].id : null
}

output "aws_cloudwatch_dashboard_natgateway_metrics_id" {
  value = var.enable_natgateway_metrics ? aws_cloudwatch_dashboard.natgateway_metrics[0].id : null
}

output "aws_cloudwatch_dashboard_route53_metrics_id" {
  value = var.enable_route53_metrics ? aws_cloudwatch_dashboard.route53_metrics[0].id : null
}

output "aws_cloudwatch_dashboard_transitgateway_metrics_id" {
  value = var.enable_tg_attachment_metrics ? aws_cloudwatch_dashboard.transit_gateway_attachment_metrics[0].id : null
}