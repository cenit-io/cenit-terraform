AWS Elasticache Terraform module
=================================

Terraform module which creates a Elasticache cluster.

* [Amazon Elasticache ](https://aws.amazon.com/elasticache/)

This module creates the Elasticache instance(s) needed by any application stack. You can select between the following engines:

* redis: A single redis instance. 1 shard - 1 primary
* redis-cluster-mode-disabled: Supports up to 1 shard with 0-5 read replicas
* redis-cluster-mode-enabled: Supports up to 90 shards with n read replicas
* memcached: A single/clustered memcached deployment. Supports up to 20 nodes

Usage
-----
You'll need to have your AWS_PROFILE loaded up. Once you do, the module will ask you for the variables that you'll want to set as seen below (e.g.):

### Single redis instance

```hcl
module "redis" {
  source = "../modules/elasticache"

  # AWS profiler settings
  providers = {
    aws = aws.environment
  }

  enabled            = true
  cluster_id         = "redis"
  environment        = "dev"
  vpc_cidr           = "10.0.0.0/16"
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.private_subnet_ids
  engine             = "redis"
  node_type          = "cache.m5.2xlarge"
  port               = "6379"
  engine_version     = "5.0.6"
  maintenance_window = "sun:06:00-sun:08:00"
  cache_parameters = [
    {
      name  = "maxmemory-policy"
      value = "allkeys-lru"
    },
  ]

  # Redis specific values
  snapshot_retention_limit = "0"

  tags = {
    Env = "dev"
  }
}
```

### Memcached cluster

```hcl
module "elasticache_memcached_cluster" {
  source = "../modules/elasticache"

  # AWS provider settings
  providers = {
    "aws" = "aws.environment"
  }

  enabled              = true
  cluster_id           = "main"
  environment          = "stage"
  vpc_cidr             = "172.16.0.0/16"
  vpc_id               = "vpc-04f403024cc484f1a"
  subnet_ids           = ["subnet-047b0def3620cfe35", "subnet-00972d71f8c9b5055", "subnet-0f1fcfbe1bd702dbe"]
  engine               = "memcached"
  node_type            = "cache.t2.micro"
  port                 = "11211"
  num_cache_nodes      = 3
  engine_version       = "1.5.10"
  maintenance_window   = "sun:05:00-sun:09:00"
  parameter_group_name = "default.memcached1.5"


  # Memcached specific values
  az_mode = "cross-az"
}
```
### Redis Cluster Mode Disabled (1 shard 2 read replicas)

```hcl
module "elasticache_redis_cluster_mode_disabled" {
  source = "../modules/elasticache"

  # AWS provider settings
  providers = {
    "aws" = "aws.environment"
  }

  enabled                       = true
  cluster_id                    = "main"
  environment                   = "stage"
  vpc_cidr                      = "172.16.0.0/16"
  vpc_id                        = "vpc-04f403024cc484f1a"
  subnet_ids                    = ["subnet-047b0def3620cfe35", "subnet-00972d71f8c9b5055", "subnet-0f1fcfbe1bd702dbe"]
  engine                        = "redis-cluster-mode-disabled"
  node_type                     = "cache.t2.small"
  port                          = 6379
  engine_version                = "5.0.4"
  maintenance_window            = "sun:05:00-sun:09:00"
  parameter_group_name          = "default.redis5.0"
  availability_zones            = "${module.vpc.database_subnets_azs}"


  # Redis specific
  snapshot_window          = "00:00-04:00"
  snapshot_retention_limit = "0"           # NOTE: Not supported on t2.micro instances

  # Redis-cluster mode disabled specific values
  read_replicas = 2
}
```

### Redis Cluster Mode Enabled (2 shards and a single read replica each)

```hcl
module "elasticache_redis_cluster" {
  source = "../modules/elasticache"

  # AWS provider settings
  providers = {
    "aws" = "aws.environment"
  }

  enabled                    = true
  cluster_id                 = "main"
  environment                = "stage"
  vpc_cidr                   = ["172.16.0.0/16"]
  vpc_id                     = "vpc-04f403024cc484f1a"
  subnet_ids                 = ["subnet-047b0def3620cfe35", "subnet-00972d71f8c9b5055", "subnet-0f1fcfbe1bd702dbe"]
  engine                     = "redis-cluster-mode-enabled"
  node_type                  = "cache.t2.small"
  port                       = 6379
  parameter_group_name       = "default.redis5.0.cluster.on"
  automatic_failover_enabled = true
  engine_version             = "5.0.4"
  maintenance_window         = "sun:05:00-sun:09:00"
  snapshot_window            = "00:00-04:00"
  snapshot_retention_limit   = "5"

  # Redis-cluster mode enabled specific values
  replicas_per_node_group = 1
  num_node_groups         = 2
}

```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| apply_immediately | Specifies whether any database modifications are applied immediately, or during the next maintenance window | string | `"false"` | no |
| at_rest_encryption_enabled | Whether to enable encryption at rest | string | `"true"` | no |
| automatic_failover_enabled | Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails | string | `"true"` | no |
| availability_zones | The Availability Zone for the cache cluster | list | `<list>` | no |
| az_mode | Specifies whether the nodes in this Memcached node group are created in a single Availability Zone or created across multiple Availability Zones in the cluster's region. Valid values for this parameter are single-az or cross-az, default is single-az. If you want to choose cross-az, num_cache_nodes must be greater than 1 | string | `"single-az"` | no |
| cluster_id | The name of the cluster, group identifier. ElastiCache converts this name to lowercase | string | n/a | yes |
| enabled | A variable that indicates if module is enabled | string | n/a | yes |
| engine | The name of the cache engine to be used for this cache cluster. Valid values for this parameter are memcached, redis or redis-cluster | string | n/a | yes |
| engine_version | Version number of the cache engine to be used | string | n/a | yes |
| environment | The environment where you want to create the resources | string | n/a | yes |
| maintenance_window | Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC) | string | n/a | yes |
| node_type | The compute and memory capacity of the nodes | string | n/a | yes |
| num_cache_nodes | The initial number of cache nodes that the cache cluster will have. For Redis, this value must be 1. For Memcache, this value must be between 1 and 20 | string | `"1"` | no |
| num_node_groups | Specify the number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications. | string | `"2"` | no |
| parameter_group_name | The name of the parameter group to associate with this cache cluster | string | n/a | yes |
| port | The port number on which each of the cache nodes will accept connections. For Memcache the default is 11211, and for Redis the default port is 6379. | string | n/a | yes |
| read_replicas | The number of cache clusters (replicas) this replication group will have | string | `"1"` | no |
| replicas_per_node_group | Specify the number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource | string | `"1"` | no |
| replication_group_description | A user-created description for the replication group | string | `"Managed by Terraform"` | no |
| security_group_ids | One or more VPC security groups associated with the cache cluster | list | `<list>` | no |
| snapshot_retention_limit | The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned | string | `"0"` | no |
| snapshot_window | The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster | string | `""` | no |
| subnet_ids | A list of subnets that are going to be used for datastore deployment | list | n/a | yes |
| tags | A map of tags to add to all resources | map | `<map>` | no |
| transit_encryption_enabled | Whether to enable encryption in transit | string | `"false"` | no |
| vpc_cidr | A list the VPC CIDR that is going to be used for datastore deployment | list | n/a | yes |
| vpc_id | The id of the VPC that is going to be used for datastore deployment | string | n/a | yes |
| cache_parameters | List of parameter keys and values to be used, using this argument will create a new parameter group | list(map) | [] | no |

## Outputs

| Name | Description |
|------|-------------|
| cache_nodes | Shows a list of node objects including id, address, port and availability_zone |
| configuration_endpoint_address | Shows the address of the replication group configuration endpoint when cluster mode is enabled. |
| primary_endpoint_address | Shows the address of the endpoint for the primary node in the replication group, if the cluster mode is disabled. |

Authors
-------
Module created by Caylent.
