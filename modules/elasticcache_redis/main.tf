## Set base labels
module "base_label" {
  # source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.19.2"
  source      = "git::https://github.com/cloudposse/terraform-null-label.git"
  namespace   = "redis"
  name        = var.cluster_id
  environment = var.environment
  tags        = var.tags
}

## Create datastore subnet group
resource "aws_elasticache_subnet_group" "datastore_subnet" {
  count      = var.enabled ? 1 : 0
  name       = var.cluster_id
  subnet_ids = var.subnet_ids
}

## Create Redis-single-instance/Memcached-cluster datastore
resource "aws_elasticache_cluster" "datastore_cache" {
  count = local.check_engine_type && var.enabled ? 1 : 0

  # NOTE: cluster_id only supports up to 20 characters
  cluster_id           = var.cluster_id
  engine               = var.engine
  engine_version       = var.engine_version
  node_type            = var.node_type
  port                 = var.port
  num_cache_nodes      = local.datastore_num_cache_nodes
  subnet_group_name    = aws_elasticache_subnet_group.datastore_subnet[0].name
  security_group_ids   = [aws_security_group.datastore_sg[0].id]
  maintenance_window   = var.maintenance_window
  parameter_group_name = local.parameter_group
  apply_immediately    = var.apply_immediately
  snapshot_arns        = var.snapshot_arns == [""] ? null : var.snapshot_arns

  # Redis specific values
  snapshot_window          = var.snapshot_window
  snapshot_retention_limit = var.snapshot_retention_limit

  # Memcached specific values
  az_mode = var.az_mode

  tags = var.tags

  depends_on = [
    aws_elasticache_subnet_group.datastore_subnet,
    aws_security_group.datastore_sg,
  ]
}

## Create Redis cluster-mode enabled datastore
resource "aws_elasticache_replication_group" "redis_cluster_mode_enabled" {
  count = var.engine == "redis-cluster-mode-enabled" && var.enabled ? 1 : 0

  replication_group_id          = "${module.base_label.namespace}-${var.cluster_id}-${module.base_label.environment}"
  replication_group_description = var.replication_group_description
  node_type                     = var.node_type
  port                          = var.port
  parameter_group_name          = local.parameter_group
  automatic_failover_enabled    = var.automatic_failover_enabled
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  transit_encryption_enabled    = var.transit_encryption_enabled
  engine_version                = var.engine_version
  subnet_group_name             = aws_elasticache_subnet_group.datastore_subnet[0].name
  security_group_ids            = [aws_security_group.datastore_sg[0].id]
  maintenance_window            = var.maintenance_window
  snapshot_window               = var.snapshot_window
  snapshot_retention_limit      = var.snapshot_retention_limit
  apply_immediately             = var.apply_immediately
  snapshot_arns                 = var.snapshot_arns == [""] ? null : var.snapshot_arns

  # Redis-cluster mode enabled specific values
  cluster_mode {
    replicas_per_node_group = var.replicas_per_node_group
    num_node_groups         = var.num_node_groups
  }

  tags = var.tags

  depends_on = [
    aws_elasticache_subnet_group.datastore_subnet,
    aws_security_group.datastore_sg,
  ]
}

## Create Redis cluster-mode disabled datastore
resource "aws_elasticache_replication_group" "redis_cluster_mode_disabled" {
  count = var.engine == "redis-cluster-mode-disabled" && var.enabled ? 1 : 0

  replication_group_id          = module.base_label.id
  replication_group_description = var.replication_group_description
  node_type                     = var.node_type
  port                          = var.port
  parameter_group_name          = local.parameter_group
  automatic_failover_enabled    = var.automatic_failover_enabled
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  transit_encryption_enabled    = var.transit_encryption_enabled
  engine_version                = var.engine_version
  subnet_group_name             = aws_elasticache_subnet_group.datastore_subnet[0].name
  security_group_ids            = [aws_security_group.datastore_sg[0].id]
  maintenance_window            = var.maintenance_window
  snapshot_window               = var.snapshot_window
  snapshot_retention_limit      = var.snapshot_retention_limit
  apply_immediately             = var.apply_immediately
  snapshot_arns                 = var.snapshot_arns == [""] ? null : var.snapshot_arns

  # Redis-cluster mode enabled specific values
  number_cache_clusters = local.datastore_num_cache_nodes

  tags = var.tags

  lifecycle {
    ignore_changes = [number_cache_clusters]
  }

  depends_on = [
    aws_elasticache_subnet_group.datastore_subnet,
    aws_security_group.datastore_sg,
  ]
}

## Create Redis read-replica for redis cluster_mode_disabled
# NOTE: Creates (read_replicas -1) as main cluster-mode disabled creates a replica by default
resource "aws_elasticache_cluster" "cluster_mode_disabled_replica" {
  count = var.engine == "redis-cluster-mode-disabled" && var.enabled ? var.read_replicas - 1 : 0

  replication_group_id = aws_elasticache_replication_group.redis_cluster_mode_disabled[0].replication_group_id
  cluster_id           = format("replica-%d", count.index + 1)
  availability_zone    = element(var.availability_zones, count.index + 1)
}

