resource "aws_codebuild_project" "this" {
  artifacts {
    encryption_disabled    = "false"
    override_artifact_name = "false"
    type                   = "NO_ARTIFACTS"
  }

  badge_enabled = "true"
  build_timeout = "60"

  cache {
    type = "NO_CACHE"
  }

  concurrent_build_limit = "1"
  encryption_key         = "arn:aws:kms:us-east-1:035696680276:alias/aws/s3"

  environment {
    compute_type = var.build_compute_type

    dynamic "environment_variable" {
      for_each = var.codebuild_env_variables
      content {
        name  = environment_variable.value.name
        type  = environment_variable.value.type
        value = environment_variable.value.value
      }
    }

    image                       = "aws/codebuild/standard:5.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = "true"
    type                        = "LINUX_CONTAINER"
  }

  logs_config {
    cloudwatch_logs {
      status     = var.enable_cloudwatch_logs ? "ENABLED" : "DISABLED"
      group_name = var.enable_cloudwatch_logs ? aws_cloudwatch_log_group.codebuild_log_group.arn : null
    }

    s3_logs {
      status = "DISABLED"
    }
  }

  name           = var.project_name
  queued_timeout = "480"
  service_role   = aws_iam_role.codebuild_role.arn

  source {
    git_clone_depth = "0"

    git_submodules_config {
      fetch_submodules = "false"
    }

    insecure_ssl        = "false"
    location            = var.repository_url
    report_build_status = "true"
    type                = "BITBUCKET"
  }

  source_version = var.source_branch
}