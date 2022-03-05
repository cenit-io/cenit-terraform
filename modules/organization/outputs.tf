# Outputs

output "organization_arn" {
  value = join("", aws_organizations_organization.primary.*.arn)
}

output "organization_id" {
  value = join("", aws_organizations_organization.primary.*.id)
}

output "master_account_arn" {
  value = join(
    "",
    aws_organizations_organization.primary.*.master_account_arn,
  )
}
output "master_account_id" {
  value = join(
    "",
    aws_organizations_organization.primary.*.master_account_id,
  )
}

output "master_account_email" {
  value = join(
    "",
    aws_organizations_organization.primary.*.master_account_email,
  )
}

output "root_ou_id" {
  value = join("", aws_organizations_organization.primary.*.roots[0].*.id)
}
