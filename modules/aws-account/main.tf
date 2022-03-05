# --------------------------------------------------------------------
# Aws organization  account settings
# --------------------------------------------------------------------


resource "aws_organizations_account" "account" {
  count                      = var.member_account ? 1 : 0
  name                       = var.name_account_config
  email                      = var.email_account_config
  role_name                  = var.admin_role_name
  iam_user_access_to_billing = var.enable_billing_access
  parent_id                  = var.parent_id
  tags                       = var.tags

  lifecycle {
    ignore_changes = [
      iam_user_access_to_billing,
      role_name
    ]
  }
}
