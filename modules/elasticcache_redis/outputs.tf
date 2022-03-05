# Shows a list of node objects including id, address, port and availability_zone
#output "cache_nodes" {
#  value = join(
#    "",
#    aws_elasticache_cluster.datastore_cache.*.cache_nodes,
#  )
#}

# Shows the address of the replication group configuration endpoint when cluster mode is enabled.
output "configuration_endpoint_address" {
  value = join(
    "",
    aws_elasticache_replication_group.redis_cluster_mode_enabled.*.configuration_endpoint_address,
  )
}

# Shows the address of the endpoint for the primary node in the replication group, if the cluster mode is disabled.
output "primary_endpoint_address" {
  value = join(
    "",
    aws_elasticache_replication_group.redis_cluster_mode_disabled.*.primary_endpoint_address,
  )
}

