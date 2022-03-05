# --------------------------------------------------------------------
# Aws org settings
# --------------------------------------------------------------------


resource "aws_organizations_organization" "primary" {
  count                         = var.create_organization ? 1 : 0
  aws_service_access_principals = var.service_access_principals
  enabled_policy_types          = var.policy_types
  feature_set                   = var.feature
}

