module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "1.25.0"

  bucket = "cenit-terraform-${lower(var.environment_name)}"
  acl    = "private"

  versioning = {
    enabled = true
  }

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "terraform-lock-${var.environment_name}"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_iam_role" "terraform_role" {
  name               = "terraform_role_${var.environment_name}"
  assume_role_policy = data.aws_iam_policy_document.principal_list.json

  depends_on = [aws_dynamodb_table.terraform_state_lock, module.s3_bucket]
}

# dynamically creating multiple principal ids for a single json policy passed to the assume role policy
# this ensures that only the specific customer account ids can assume this role and get access to the backend resources: s3, dynamodb
data "aws_iam_policy_document" "principal_list" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id}:root"]
    }
  }
}


resource "aws_iam_role_policy" "terraform_role_policy" {
  name   = "terraform_role_policy_${var.environment_name}"
  role   = aws_iam_role.terraform_role.id
  policy = data.aws_iam_policy_document.backend_access_policy.json

  depends_on = [aws_iam_role.terraform_role]
}


# using document policy to create a simple iam policy for terraform role to access the backend resources
data "aws_iam_policy_document" "backend_access_policy" {
  policy_id = "terraform_backend_access_policy_${var.environment_name}"
  version   = "2012-10-17"
  statement {
    sid    = "s3AccessforTerraform"
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:PutObject"
    ]
    resources = [
      module.s3_bucket.this_s3_bucket_arn,
      "${module.s3_bucket.this_s3_bucket_arn}/*" #this could reference the previous s3 module
    ]
  }

  statement {
    sid    = "DynamodbAccessforTerraform"
    effect = "Allow"
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem"
    ]
    resources = [
      aws_dynamodb_table.terraform_state_lock.arn
    ]
  }
  depends_on = [aws_dynamodb_table.terraform_state_lock, module.s3_bucket]
}
