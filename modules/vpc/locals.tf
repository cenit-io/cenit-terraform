locals {
  nat_gw_count = var.single_nat_gw ? 1 : length(var.azs)
  inbound_traffic_public_subnet = concat(
    var.allow_inbound_traffic_default_public_subnet,
    var.allow_inbound_traffic_public_subnet,
  )
  inbound_traffic_private_subnet = concat(
    var.allow_inbound_traffic_default_private_subnet,
    var.allow_inbound_traffic_private_subnet,
  )
  all_private_subnet_ids = concat(
    aws_subnet.private_subnets.*.id,
    aws_subnet.private_db_subnets.*.id,
  )
}

