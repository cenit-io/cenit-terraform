###
# Do resource lookups we'll need
# ------------------------------
# 
data "aws_caller_identity" "second" {
  count    = var.use_transit_gw && var.remote_transit_gw ? 1 : 0
  provider = aws
}

###
# Lookup AWS Orgs ID
# ------------------
# This is temporarily disabled, since Org ID RAM sharing is broken
#data "aws_organizations_organization" "this" {
#  count    = "${var.create_transit_gw && var.share_transit_gw ? 1 : 0}"
#  provider = "aws.orgs"
#}

###
# Transit Gateway Sharing
# -----------------------
# Transit Gateway Sharing requires 5 steps, we'll cover individually:
# 1) Make a resource share in AWS Resource Access Manager
resource "aws_ram_resource_share" "transitgw" {
  count = var.create_transit_gw && var.share_transit_gw && false == var.remote_transit_gw ? 1 : 0

  #provider                  = "aws.transitgw"
  provider = aws

  name                      = "${var.environment}-transitgw"
  allow_external_principals = var.allow_external_principals

  tags = {
    Name = "${var.environment}-transitgw"
  }
}

# 2) Make a resource association between the RAM share and the transitgw we created
resource "aws_ram_resource_association" "transitgw" {
  count = var.create_transit_gw && var.share_transit_gw && false == var.remote_transit_gw ? 1 : 0

  provider = aws

  resource_arn       = aws_ec2_transit_gateway.this[0].arn
  resource_share_arn = aws_ram_resource_share.transitgw[0].id
  depends_on = [
    aws_ram_resource_share.transitgw,
    aws_ec2_transit_gateway.this,
  ]
}

# 3) Share the AWS RAM Resource share we associated with transitgw with the account
# we want to add into the transitgw
resource "aws_ram_principal_association" "transitgw" {
  count    = var.shared_with_root_org ? 1 : 0
  provider = aws.transitgw

  principal          = var.root_organization_arn
  resource_share_arn = aws_ram_resource_share.transitgw[0].id
}

