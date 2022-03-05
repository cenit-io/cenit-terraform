# terraform {
#   backend "s3" {
#     bucket                  = "cenit-terraform-dev"
#     key                     = "terraform.tfstate"
#     region                  = "us-east-1"
#     dynamodb_table          = "terraform-lock-dev"
#     role_arn                = "arn:aws:iam::035696680276:role/terraform_role_dev"
#     shared_credentials_file = "$HOME/.aws/credentials"
#   }
# }
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "cenit"

    workspaces {
      name = "cenit-development-aws-infrastructure"
    }
  }
}
