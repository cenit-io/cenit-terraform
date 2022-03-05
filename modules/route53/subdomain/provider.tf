# Default provider for API calls in the root account.
# Needed to delegate the subdomain in the parent/root account.

provider "aws" {
  alias = "domain"
}

provider "aws" {
  alias = "subdomain"
}
