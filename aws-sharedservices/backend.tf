terraform {
  backend "s3" {
    bucket                  = "cenit-terraform-shared"
    key                     = "terraform.tfstate"
    region                  = "us-east-1"
    dynamodb_table          = "terraform-lock-shared"
    role_arn                = "arn:aws:iam::035696680276:role/terraform_role_shared"
    shared_credentials_file = "$HOME/.aws/credentials"
  }
}
