resource "aws_codepipeline" "this" {
  artifact_store {
    location = aws_s3_bucket.codepipeline_bucket.bucket
    type     = "S3"
  }

  name     = var.project_name
  role_arn = aws_iam_role.codepipeline_role.arn

  stage {
    action {
      category = "Source"

      configuration = {
        BranchName           = var.source_branch
        ConnectionArn        = aws_codestarconnections_connection.this.arn
        FullRepositoryId     = var.repository_id
        OutputArtifactFormat = "CODE_ZIP"
      }

      name             = "Source"
      namespace        = "SourceVariables"
      output_artifacts = ["SourceArtifact"]
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      region           = "us-east-1"
      run_order        = "1"
      version          = "1"
    }

    name = "Source"
  }

  stage {
    action {
      category = "Build"

      configuration = {
        ProjectName = "${var.project_name}"
      }

      input_artifacts = ["SourceArtifact"]
      name            = var.project_name
      owner           = "AWS"
      provider        = "CodeBuild"
      region          = "us-east-1"
      run_order       = "1"
      version         = "1"
    }

    name = "Build"
  }
}