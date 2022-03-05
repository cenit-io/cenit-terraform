# ------------------------------------------------
# Aws Organizations Organizational Unit settings
# ------------------------------------------------


resource "aws_organizations_organizational_unit" "default" {
  name      = var.name
  parent_id = var.parent_id
  lifecycle {
    create_before_destroy = true
  }
}
