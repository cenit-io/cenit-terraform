terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "cenit"

    workspaces {
      name = "cenit-production-aws-infrastructure"
    }
  }
}
