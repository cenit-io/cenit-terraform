data "aws_iam_policy_document" "codebuild_assumerole_policy" {

  statement {
    sid    = "CodeBuildTrustPolicy"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "codebuild_role" {
  name               = "${var.project_name}-CodeBuildRole"
  assume_role_policy = data.aws_iam_policy_document.codebuild_assumerole_policy.json
}

data "aws_iam_policy_document" "codepipeline_assumerole_policy" {

  statement {
    sid    = "CodePipelineTrustPolicy"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "codepipeline_role" {
  name               = "${var.project_name}-CodePipelineRole"
  assume_role_policy = data.aws_iam_policy_document.codepipeline_assumerole_policy.json
}