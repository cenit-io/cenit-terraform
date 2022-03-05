# -------------------------------------------------------------
# Global variables
# -------------------------------------------------------------

variable "environment" {
  description = "The environment where you want to create the resources"
}

variable "enabled" {
  description = "A variable that indicates if module is enabled"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

# -------------------------------------------------------------
# Network variables
# -------------------------------------------------------------

variable "vpc_cidr" {
  type        = list(string)
  description = "A list the VPC CIDR that is going to be used for datastore deployment"
}

variable "vpc_id" {
  description = "The id of the VPC that is going to be used for datastore deployment"
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of subnets that are going to be used for datastore deployment"
}

# -------------------------------------------------------------
# Datastore variables
# -------------------------------------------------------------

variable "cluster_id" {
  description = "The name of the cluster, group identifier. ElastiCache converts this name to lowercase"
}

variable "engine" {
  description = "The name of the cache engine to be used for this cache cluster. Valid values for this parameter are memcached, redis or redis-cluster"
}

variable "node_type" {
  description = "The compute and memory capacity of the nodes"
}

variable "engine_version" {
  description = "Version number of the cache engine to be used"
}

variable "maintenance_window" {
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC)"
}

variable "parameter_group_name" {
  description = "The name of the parameter group to associate with this cache cluster"
  default     = ""
}

variable "cache_parameters" {
  description = "A list of maps containing the DB parameters to apply (depends on the family)"
  default     = []
  # example:
  #
  # default = [
  #   {
  #     name  = "maxmemory-policy"
  #     value = "allkeys-lru"
  #   },
  # ]
  #
}

variable "port" {
  description = "The port number on which each of the cache nodes will accept connections. For Memcache the default is 11211, and for Redis the default port is 6379. "
}

variable "num_cache_nodes" {
  description = "The initial number of cache nodes that the cache cluster will have. For Redis, this value must be 1. For Memcache, this value must be between 1 and 20"
  default     = 1
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  default     = false
}

variable "availability_zones" {
  description = "The Availability Zone for the cache cluster"
  type        = list(string)
  default     = []
}

# -------------------------------------------------------------
# Redis specific variables
# -------------------------------------------------------------

## NOTE: The snapshot window and maintenance window must not overlap
## NOTE: default = "" value is memcached safe
variable "snapshot_window" {
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster"
  default     = ""
}

## NOTE: Not supported on cache.t1.micro or cache.t2.* nodes
## NOTE: default = "0" value is memcached safe
variable "snapshot_retention_limit" {
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned "
  default     = 0
}

variable "snapshot_arns" {
  description = "The arn from the s3 snapshot to launch the instance from"
  default     = [""]
}

# -------------------------------------------------------------
# Global Redis-cluster-mode disabled/enabled variables
# -------------------------------------------------------------

variable "replication_group_description" {
  description = "A user-created description for the replication group"
  default     = "Managed by Terraform"
}

variable "automatic_failover_enabled" {
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails"
  default     = true
}

variable "at_rest_encryption_enabled" {
  description = "Whether to enable encryption at rest"
  default     = true
}

# NOTE: if you want to implement transit encryption, you must install stunnel in order to connect to the cluster
# for more info: https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/in-transit-encryption.html
variable "transit_encryption_enabled" {
  description = "Whether to enable encryption in transit"
  default     = false
}

# -------------------------------------------------------------
# Redis-cluster-mode enabled specific variables
# -------------------------------------------------------------

variable "replicas_per_node_group" {
  description = "Specify the number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource"
  default     = 1
}

variable "num_node_groups" {
  description = "Specify the number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications."
  default     = 2
}

# -------------------------------------------------------------
# Redis cluster-mode disabled specific variables
# -------------------------------------------------------------

# NOTE: Primary has already been taken care
variable "read_replicas" {
  description = "The number of cache clusters (replicas) this replication group will have"
  default     = 1
}

# -------------------------------------------------------------
# Memcached specific variables
# -------------------------------------------------------------

variable "az_mode" {
  description = "Specifies whether the nodes in this Memcached node group are created in a single Availability Zone or created across multiple Availability Zones in the cluster's region. Valid values for this parameter are single-az or cross-az, default is single-az. If you want to choose cross-az, num_cache_nodes must be greater than 1"
  default     = "single-az"
}

# -------------------------------------------------------------
# Security variables
# -------------------------------------------------------------

variable "security_group_ids" {
  description = "One or more VPC security groups associated with the cache cluster"
  type        = list(string)
  default     = []
}

