resource "aws_cloudwatch_log_group" "codebuild_log_group" {
  count = var.enable_cloudwatch_logs ? 1 : 0
  name  = "/aws/codebuild/${var.project_name}-codebuild-logs"
  #retention = TBC //TODO
}