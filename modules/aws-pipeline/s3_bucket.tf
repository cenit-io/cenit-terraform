resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket_prefix = "codepipeline-us-east-1-${var.project_name}-"
  acl           = "private"

  tags = {
    Name    = "${var.project_name}-CodePipeline"
    OwnedBy = "Terraform"
  }
}