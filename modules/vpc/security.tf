# --------------------------------------------------------------------
# Security settings (NACL rules)
# --------------------------------------------------------------------

## Network ACL for public subnets
resource "aws_network_acl" "public_subnets" {
  count      = var.enable_nacls ? 1 : 0
  provider   = aws
  vpc_id     = aws_vpc.this.id
  subnet_ids = aws_subnet.public_subnets.*.id
  tags = merge(
    {
      "Name" = "${var.environment}-acl_public_subnets"
    },
    var.tags,
  )
}

## public subnets ACL rule: allow traffic between subnets in the VPC
resource "aws_network_acl_rule" "allow_private_inbound_vpc_traffic_public_subnet" {
  count          = var.enable_nacls ? 1 : 0
  provider       = aws
  network_acl_id = aws_network_acl.public_subnets[0].id
  rule_number    = 50
  egress         = false
  protocol       = -1
  from_port      = 0
  to_port        = 0
  cidr_block     = var.vpc_cidr
  rule_action    = "allow"
}

## public subnets ACL rule: allow default and custom inbound traffic
resource "aws_network_acl_rule" "allow_inbound_traffic_public_subnet" {
  count          = var.enable_nacls ? length(local.inbound_traffic_public_subnet) : 0
  provider       = aws
  network_acl_id = aws_network_acl.public_subnets[0].id
  rule_number    = 100 + count.index * 10
  egress         = false
  protocol       = local.inbound_traffic_public_subnet[count.index]["protocol"]
  from_port      = local.inbound_traffic_public_subnet[count.index]["from_port"]
  to_port        = local.inbound_traffic_public_subnet[count.index]["to_port"]
  cidr_block     = local.inbound_traffic_public_subnet[count.index]["source"]
  rule_action    = "allow"
}

## public subnets ACL rule: allow outbound traffic
resource "aws_network_acl_rule" "allow_outbound_traffic_public_subnet" {
  count          = var.enable_nacls ? 1 : 0
  provider       = aws
  network_acl_id = aws_network_acl.public_subnets[0].id
  rule_number    = 50
  egress         = true
  protocol       = -1
  from_port      = 0
  to_port        = 0
  cidr_block     = "0.0.0.0/0"
  rule_action    = "allow"
}

## Network ACL for private subnets
resource "aws_network_acl" "private_subnets" {
  count      = var.enable_nacls ? 1 : 0
  provider   = aws
  vpc_id     = aws_vpc.this.id
  subnet_ids = local.all_private_subnet_ids
  tags = merge(
    {
      "Name" = "${var.environment}-acl_private_subnets"
    },
    var.tags,
  )
}

## private subnets ACL rule: allow traffic between subnets in the VPC
resource "aws_network_acl_rule" "allow_private_inbound_vpc_traffic_private_subnet" {
  count          = var.enable_nacls ? 1 : 0
  provider       = aws
  network_acl_id = aws_network_acl.private_subnets[0].id
  rule_number    = 50
  egress         = false
  protocol       = -1
  from_port      = 0
  to_port        = 0
  cidr_block     = var.vpc_cidr
  rule_action    = "allow"
}

## private subnets ACL rule: allow default and custom inbound traffic
resource "aws_network_acl_rule" "allow_inbound_traffic_private_subnet" {
  count          = var.enable_nacls ? length(local.inbound_traffic_private_subnet) : 0
  provider       = aws
  network_acl_id = aws_network_acl.private_subnets[0].id
  rule_number    = 100 + count.index * 10
  egress         = false
  protocol       = local.inbound_traffic_private_subnet[count.index]["protocol"]
  from_port      = local.inbound_traffic_private_subnet[count.index]["from_port"]
  to_port        = local.inbound_traffic_private_subnet[count.index]["to_port"]
  cidr_block     = local.inbound_traffic_private_subnet[count.index]["source"]
  rule_action    = "allow"
}

## private subnets ACL rule: allow outbound traffic
resource "aws_network_acl_rule" "allow_outbound_traffic_private_subnet" {
  count          = var.enable_nacls ? 1 : 0
  provider       = aws
  network_acl_id = aws_network_acl.private_subnets[0].id
  rule_number    = 50
  egress         = true
  protocol       = -1
  from_port      = 0
  to_port        = 0
  cidr_block     = "0.0.0.0/0"
  rule_action    = "allow"
}

## Optionally enable all of icmp for diagnostics
resource "aws_network_acl_rule" "allow_inbound_icmp_private_subnet" {
  count          = var.enable_nacls && var.icmp_diagnostics_enable ? 1 : 0
  provider       = aws
  network_acl_id = aws_network_acl.private_subnets[0].id
  rule_number    = 255
  egress         = false
  protocol       = "icmp"
  icmp_type      = -1
  icmp_code      = -1
  cidr_block     = "0.0.0.0/0"
  rule_action    = "allow"
}

resource "aws_network_acl_rule" "allow_inbound_icmp_public_subnet" {
  count          = var.enable_nacls && var.icmp_diagnostics_enable ? 1 : 0
  provider       = aws
  network_acl_id = aws_network_acl.public_subnets[0].id
  rule_number    = 255
  egress         = false
  protocol       = "icmp"
  icmp_type      = -1
  icmp_code      = -1
  cidr_block     = "0.0.0.0/0"
  rule_action    = "allow"
}

