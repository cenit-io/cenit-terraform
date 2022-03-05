# -------------------------------------------------------------
# VPC outputs
# -------------------------------------------------------------

output "environment" {
  description = "Name of the environment we provisioned the VPC for"
  value       = var.environment
}

output "vpc_id" {
  description = "ID of the provisioned VPC"
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "CIDR of the overall environment config (covering all subnets)"
  value       = var.vpc_cidr
}

output "azs" {
  description = "List of Availability Zones provisioned within"
  value       = var.azs
}

output "public_subnet_ids" {
  description = "List of public subnet IDs provisioned"
  value       = aws_subnet.public_subnets.*.id
}

output "public_subnet_cidrs" {
  description = "List of public subnet cidr blocks provisioned"
  value       = var.public_subnet_cidrs
}

output "eip_nat_gateways" {
  description = "List of public ips for Nat Gateways"
  value       = aws_eip.elastic_ip.*.public_ip
}

output "private_subnet_ids" {
  description = "List of private subnet IDs provisioned"
  value       = aws_subnet.private_subnets.*.id
}

output "private_subnet_cidrs" {
  description = "List of private subnet cidr blocks provisioned"
  value       = var.private_subnet_cidrs
}

output "db_subnet_ids" {
  description = "List of database subnet IDs provisioned"
  value       = aws_subnet.private_db_subnets.*.id
}

output "db_subnet_cidrs" {
  description = "List of database subnet cidr blocks provisioned"
  value       = var.db_subnet_cidrs
}

output "database_subnets_azs" {
  description = "List of the AZ for the subnet"
  value       = aws_subnet.private_db_subnets.*.availability_zone
}

output "igw_id" {
  description = "Internet Gateway ID provisioned"
  value       = join(",", aws_internet_gateway.this.*.id)
}

output "nat_gw_ids" {
  description = "List of NAT Gateway IDs provisioned"
  value       = aws_nat_gateway.nat_gw.*.id
}

output "transit_gw_arn" {
  description = "ARN of the Transit Gateway provisioned"
  value       = join(",", aws_ec2_transit_gateway.this.*.arn)
}

output "transit_gw_id" {
  description = "ID of the Transit Gateway provisioned"
  value       = join(",", aws_ec2_transit_gateway.this.*.id)
}

output "transit_gw_owner_id" {
  description = "Owner ID of the Transit Gateway provisioned"
  value       = join(",", aws_ec2_transit_gateway.this.*.owner_id)
}

output "transit_gw_rt_id" {
  description = "ID of the Transit Gateway Route Table provisioned"
  value = var.default_route_table_association == "enable" ? join(
    ",",
    aws_ec2_transit_gateway.this.*.association_default_route_table_id,
  ) : join(",", aws_ec2_transit_gateway_route_table.initial.*.id)
}

output "transit_gw_assocation_rt_id" {
  description = "ID of the Transit Gateway Association Route Table"
  value = var.default_route_table_association == "enable" ? join(
    ",",
    aws_ec2_transit_gateway.this.*.association_default_route_table_id,
  ) : join(",", aws_ec2_transit_gateway_route_table.initial.*.id)
}

output "transit_gw_propagation_rt_id" {
  description = "ID of the Transit Gateway Propagation Route Table"
  value = var.default_route_table_propagation == "enable" ? join(
    ",",
    aws_ec2_transit_gateway.this.*.propagation_default_route_table_id,
  ) : join(",", aws_ec2_transit_gateway_route_table.initial.*.id)
}

output "transit_gw_share_arn" {
  description = "ARN of the Transit Gateway RAM Share"
  value       = join(",", aws_ram_resource_share.transitgw.*.id)
}

# The below two may be needed in the future, so keeping them around until after
# the features for invitations and acceptance are done.
#
#output "transit_gw_association_default_route_table_id" {
#  value = "${aws_ec2_transit_gateway.this.*.association_default_route_table_id}"
#}
#output "transit_gw_propogation_default_route_table_id" {
#  value = "${aws_ec2_transit_gateway.this.*.propogation_default_route_table_id}"
#}
