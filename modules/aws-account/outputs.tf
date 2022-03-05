# --------------------------------------------------------------------
# Aws organization account output
# --------------------------------------------------------------------


output "account_id" {
  value = join("", aws_organizations_account.account.*.id)
}

output "account_arn" {
  value = join("", aws_organizations_account.account.*.arn)
}

