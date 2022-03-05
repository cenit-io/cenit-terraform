output "organizations_organizational_unit_id" {
  description = "Identifier of the organization unit"
  value       = join("", aws_organizations_organizational_unit.default.*.id)
}

output "organizations_organizational_unit_arn" {
  description = "Identifier of the organization unit"
  value       = join("", aws_organizations_organizational_unit.default.*.arn)
}

