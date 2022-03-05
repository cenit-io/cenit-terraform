data "aws_iam_policy_document" "codepipeline_policy" {

  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketVersioning",
      "s3:PutObjectAcl",
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.codepipeline_bucket.arn}",
      "${aws_s3_bucket.codepipeline_bucket.arn}/*",
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "codestar-connections:UseConnection",
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "codebuild:BatchGetBuilds",
      "codebuild:StartBuild",
    ]

    resources = ["*"]
  }
}

data "aws_iam_policy_document" "codebuild_policy" {

  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "codebuild:CreateReportGroup",
      "codebuild:CreateReport",
      "codebuild:UpdateReport",
      "codebuild:BatchPutTestCases",
      "codebuild:BatchPutCodeCoverages",
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:GetAuthorizationToken",
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::codepipeline-us-east-1-${var.project_name}-*",
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "ssm:GetParameters",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "codepipeline_policy" {
  name   = "codepipeline_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.codepipeline_policy.json
}

resource "aws_iam_policy" "codebuild_policy" {
  name   = "codebuild_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.codebuild_policy.json
}

resource "aws_iam_role_policy_attachment" "codepipeline_policy_attachment" {
  policy_arn = aws_iam_policy.codepipeline_policy.arn
  role       = aws_iam_role.codepipeline_role.name
}

resource "aws_iam_role_policy_attachment" "codebuild_policy_attachment" {
  policy_arn = aws_iam_policy.codebuild_policy.arn
  role       = aws_iam_role.codebuild_role.name
}