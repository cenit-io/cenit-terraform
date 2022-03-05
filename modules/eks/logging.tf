resource "aws_cloudwatch_log_group" "eks_log_group" {
  count = var.enable_cloudwatch_logs ? 1 : 0
  name  = "/aws/eks/${var.cluster_name}/cluster"
  # retention_in_days = TBC //TODO
}