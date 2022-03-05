# -------------------------------------------------------------
# VPC outputs
# -------------------------------------------------------------

output "environment" {
  description = "Name of the environment we provisioned the VPC for"
  value       = var.environment
}

output "vpc_id" {
  description = "ID of the provisioned VPC"
  value       = module.network.vpc_id
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
  value       = module.network.public_subnet_ids
}

output "public_subnet_cidrs" {
  description = "List of public subnet cidr blocks provisioned"
  value       = module.network.public_subnet_cidrs
}

output "private_subnet_ids" {
  description = "List of private subnet IDs provisioned"
  value       = module.network.public_subnet_ids
}

output "private_subnet_cidrs" {
  description = "List of private subnet cidr blocks provisioned"
  value       = module.network.private_subnet_cidrs
}

output "db_subnet_ids" {
  description = "List of database subnet IDs provisioned"
  value       = module.network.db_subnet_ids
}

output "db_subnet_cidrs" {
  description = "List of database subnet cidr blocks provisioned"
  value       = module.network.db_subnet_cidrs
}

output "database_subnets_azs" {
  description = "List of the AZ for the subnet"
  value       = module.network.database_subnets_azs
}

output "igw_id" {
  description = "Internet Gateway ID provisioned"
  value       = module.network.igw_id
}

output "nat_gw_ids" {
  description = "List of NAT Gateway IDs provisioned"
  value       = module.network.nat_gw_ids
}

# output "transit_gw_arn" {
#   description = "ARN of the Transit Gateway provisioned"
#   value       = join(",", aws_ec2_transit_gateway.this.*.arn)
# }

# output "transit_gw_id" {
#   description = "ID of the Transit Gateway provisioned"
#   value       = join(",", aws_ec2_transit_gateway.this.*.id)
# }

# output "transit_gw_owner_id" {
#   description = "Owner ID of the Transit Gateway provisioned"
#   value       = join(",", aws_ec2_transit_gateway.this.*.owner_id)
# }

# output "transit_gw_rt_id" {
#   description = "ID of the Transit Gateway Route Table provisioned"
#   value = var.default_route_table_association == "enable" ? join(
#     ",",
#     aws_ec2_transit_gateway.this.*.association_default_route_table_id,
#   ) : join(",", aws_ec2_transit_gateway_route_table.initial.*.id)
# }

# output "transit_gw_assocation_rt_id" {
#   description = "ID of the Transit Gateway Association Route Table"
#   value = var.default_route_table_association == "enable" ? join(
#     ",",
#     aws_ec2_transit_gateway.this.*.association_default_route_table_id,
#   ) : join(",", aws_ec2_transit_gateway_route_table.initial.*.id)
# }

# output "transit_gw_propagation_rt_id" {
#   description = "ID of the Transit Gateway Propagation Route Table"
#   value = var.default_route_table_propagation == "enable" ? join(
#     ",",
#     aws_ec2_transit_gateway.this.*.propagation_default_route_table_id,
#   ) : join(",", aws_ec2_transit_gateway_route_table.initial.*.id)
# }

# output "transit_gw_share_arn" {
#   description = "ARN of the Transit Gateway RAM Share"
#   value       = join(",", aws_ram_resource_share.transitgw.*.id)
# }

# # The below two may be needed in the future, so keeping them around until after
# # the features for invitations and acceptance are done.
# #
# #output "transit_gw_association_default_route_table_id" {
# #  value = "${aws_ec2_transit_gateway.this.*.association_default_route_table_id}"
# #}
# #output "transit_gw_propogation_default_route_table_id" {
# #  value = "${aws_ec2_transit_gateway.this.*.propogation_default_route_table_id}"
# #}


#########################
#######  EKS Outputs  ###
#########################

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster-sg" {
  value = module.eks.cluster-sg
}

output "ca" {
  value = module.eks.ca
}

output "endpoint" {
  value = module.eks.endpoint
}

output "cluster_service_role_arn" {
  value = module.eks.cluster_service_role_arn
}

output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}

output "oidc_issuer" {
  value = module.eks.oidc_issuer
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}



#########################
#######  R53 Outputs  ###
#########################

output "zone_id" {
  value = module.R53_public_hz_subdomain.zone_id
}

output "name_servers" {
  value = module.R53_public_hz_subdomain.name_servers
}

output "parent_domain_name" {
  value = module.R53_public_hz_subdomain.parent_domain_name
}

output "subdomain_name" {
  value = module.R53_public_hz_subdomain.subdomain_name
}

output "fqdn" {
  value = module.R53_public_hz_subdomain.fqdn
}

output "parent_zone_id" {
  value = module.R53_public_hz_subdomain.parent_zone_id
}


#########################
#######  R53 Outputs  ###
#########################

output "acm_certificate_arn" {
  value = module.acm.acm_certificate_arn
}


#########################
#######  Elastic Cache - Redis Outputs  ###
#########################

# Shows the address of the replication group configuration endpoint when cluster mode is enabled.
output "redis_configuration_endpoint_address" {
  value = module.elasticcache_redis.configuration_endpoint_address
}

# Shows the address of the endpoint for the primary node in the replication group, if the cluster mode is disabled.
output "primary_endpoint_address" {
  value = module.elasticcache_redis.primary_endpoint_address
}
