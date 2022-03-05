## Sets security groups labels
module "security_groups_label" {
  # source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.19.2"
  source  = "git::https://github.com/cloudposse/terraform-null-label.git"
  context = module.base_label.context
  name    = "${var.cluster_id}-sg"
}

## Security Group for datastore
resource "aws_security_group" "datastore_sg" {
  count  = var.enabled ? 1 : 0
  name   = module.security_groups_label.id
  vpc_id = var.vpc_id
  tags   = module.security_groups_label.tags
}

## Allow outbound traffic
resource "aws_security_group_rule" "outbound_traffic_datastore_sg" {
  count             = var.enabled ? 1 : 0
  type              = "egress"
  protocol          = -1
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.datastore_sg[0].id
}

## Allow inbound traffic to datastore port from the VPC CIDR
resource "aws_security_group_rule" "inbound_traffic_datastore_sg" {
  count             = var.enabled ? 1 : 0
  type              = "ingress"
  protocol          = "tcp"
  from_port         = var.port
  to_port           = var.port
  cidr_blocks       = var.vpc_cidr
  security_group_id = aws_security_group.datastore_sg[0].id
}

