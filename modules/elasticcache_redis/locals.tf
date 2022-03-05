locals {
  # Force num_cache_nodes to 1 if you're using Redis as engine type
  datastore_num_cache_nodes = var.engine == "redis" ? "1" : var.num_cache_nodes

  # Check engine's type for single instance datastore deployment
  check_engine_type = var.engine == "redis" || var.engine == "memcached" ? true : false

  # local expression to compute whether we want to use the custom parameter group or the default one
  parameter_group = var.cache_parameters != [] ? join("", aws_elasticache_parameter_group.elasticache_pg.*.id) : var.parameter_group_name

  engine_full_version = "${var.engine}${var.engine_version}"
  engine_family       = join(".", slice(split(".", local.engine_full_version), 0, 2))
}
