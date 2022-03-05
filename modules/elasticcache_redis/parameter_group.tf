resource "aws_elasticache_parameter_group" "elasticache_pg" {
  count       = var.enabled && var.cache_parameters != [] ? 1 : 0
  name        = "${module.base_label.id}-parameter-group"
  description = "Paramter group for instance ${module.base_label.id}"
  family      = local.engine_family


  dynamic "parameter" {
    for_each = var.cache_parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      parameter
    ]
  }
}
