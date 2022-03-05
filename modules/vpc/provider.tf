# For standalone networks and default main object configuration
provider "aws" {
  region = var.region
}

# For reaching the account with the existing Transit Gateway
provider "aws" {
  alias  = "transitgw"
  region = var.region
}

# To reach the AWS Orgs account for AWS Resource Access Manager
#provider "aws" {
#  alias  = "orgs"
#}
