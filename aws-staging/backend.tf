terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "cenit"

    workspaces {
      name = "cenit-staging-aws-infrastructure"
    }
  }
}
