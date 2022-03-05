# -------------------------------------------------------------
# -------------------------------------------------------------
#               Network variables
# -------------------------------------------------------------
# -------------------------------------------------------------

variable "region" {
  description = "The AWS region we wish to provision in, by default"
}

variable "environment" {
  description = "Name of the environment"
}

variable "shared_account_id" {
  description = "Shared account id"
}

variable "vpc_cidr" {
  description = "The CIDR range for the VPC"
}

variable "transit_gw_cidr" {
  description = "The CIDR range for the overall transit gateway network"
}

variable "enable_dns_support" {
  description = "True if the DNS support is enabled in the VPC"
}

variable "enable_dns_hostnames" {
  description = "True if DNS hostnames is enabled in the VPC"
}

variable "instance_tenancy" {
  description = "The type of tenancy for EC2 instances launched into the VPC"
}

variable "map_to_public_ip" {
  description = "True if public IPs are assigned to instances launched in a subnet"
}

variable "azs" {
  description = "A list of Availability Zones to use in a specific Region"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "A list of the CIDR ranges to use for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "A list of the CIDR ranges to use for private subnets"
  type        = list(string)
}

variable "db_subnet_cidrs" {
  description = "A list of the CIDR ranges for database subnets"
  type        = list(string)
}

variable "enable_nat_gw" {
  description = "True if we want to create at least one NAT-gw for private subnets"
}

variable "single_nat_gw" {
  description = "If true, all private and database subnets will share 1 Route Table and NAT GW.  If false, one NAT-gw per AZ will be created along with one RT per AZ."
}

variable "enable_igw" {
  description = "True if you want an igw added to your public route table"
}

variable "use_transit_gw" {
  description = "Use an existing transit gateway rather than creating standalone network objects."
}

variable "share_transit_gw" {
  description = "Share this transit gateway via AWS Resource Access Manager (RAM)"
}

variable "transit_gw_id" {
  description = "id of the transit gateway to associate with"
}

variable "transit_gw_arn" {
  description = "arn of the transit gateway to associate with"
  default     = ""
}

variable "transit_gw_rt_id" {
  description = "id of the transit gateway route table"
}

variable "transit_gw_share_arn" {
  description = "The arn of the AWS RAM Share Arn for the existing Transit Gateway"
}

variable "transit_gw_association_rt_id" {
  description = "id of the transit gateway association route table"
}

variable "transit_gw_propagation_rt_id" {
  description = "id of the transit gateway propagation route table"
}

variable "create_transit_gw" {
  description = "Create a transit gateway and related routing objects"
}

variable "remote_transit_gw" {
  description = "Is the transit gateway we are connecting to in a remote account?"
}

# variable "default_route_table_association" {
#   description = "Whether resource attachments are automatically associated with the default association route table."
# }

# variable "default_route_table_propagation" {
#   description = "Whether resource attachments automatically propagate routes to the default propagation route table."
# }

variable "tgw_description" {
  description = "Description of the transit gateway."
}

variable "auto_accept_shared_attachments" {
  description = "Whether resource attachment requests are automatically accepted."
}

variable "vpn_ecmp_support" {
  description = "Whether VPN Equal Cost Multipath Protocol support is enabled."
}

variable "shared_with_root_org" {
  description = "True if this account should shared resources with the root organization "
}

variable "root_organization_arn" {
  description = "The AWS Organization root organization ARN"
}



# -------------------------------------------------------------
#  Network - Security variables
# -------------------------------------------------------------
variable "icmp_diagnostics_enable" {
  description = "Enable full icmp for diagnostic purposes"
}

variable "enable_nacls" {
  description = "Enable creation of restricted-by-default network acls."
}
variable "allow_inbound_traffic_default_public_subnet" {
  description = "A list of maps of inbound traffic allowed by default for public subnets"
  type = list(object({
    protocol  = string
    from_port = number
    to_port   = number
    source    = string
  }))

  default = [
    {
      # ephemeral tcp ports (allow return traffic for software updates to work)
      protocol  = "tcp"
      from_port = 1024
      to_port   = 65535
      source    = "0.0.0.0/0"
    },
    {
      # ephemeral udp ports (allow return traffic for software updates to work)
      protocol  = "udp"
      from_port = 1024
      to_port   = 65535
      source    = "0.0.0.0/0"
    },
  ]
}

variable "allow_inbound_traffic_public_subnet" {
  description = "The inbound traffic the customer needs to allow for public subnets"
  type = list(object({
    protocol  = string
    from_port = number
    to_port   = number
    source    = string
  }))
  default = []
}

variable "allow_inbound_traffic_default_private_subnet" {
  description = "A list of maps of inbound traffic allowed by default for private subnets"
  type = list(object({
    protocol  = string
    from_port = number
    to_port   = number
    source    = string
  }))

  default = [
    {
      # ephemeral tcp ports (allow return traffic for software updates to work)
      protocol  = "tcp"
      from_port = 1024
      to_port   = 65535
      source    = "0.0.0.0/0"
    },
    {
      # ephemeral udp ports (allow return traffic for software updates to work)
      protocol  = "udp"
      from_port = 1024
      to_port   = 65535
      source    = "0.0.0.0/0"
    },
  ]
}

variable "allow_inbound_traffic_private_subnet" {
  description = "The ingress traffic the customer needs to allow for private subnets"
  type = list(object({
    protocol  = string
    from_port = number
    to_port   = number
    source    = string
  }))
  default = []
}

variable "allow_external_principals" {
  description = "Allow external principals to access the RAM Share for Transit Gateway?"
}

# -------------------------------------------------------------
# -------------------------------------------------------------
#             Route 53 Subdomain variables
# -------------------------------------------------------------
# -------------------------------------------------------------



variable "create_hosted_zone" {
  description = "Boolean that controls if whether to create a hosted zone or not"
  default     = true
}

variable "delegate_subdomain" {
  description = "If true, the subdomain will be delegated to the sub-account NS servers"
  default     = false
}

variable "domain_name" {
  description = "The parent domain name for whom we are creating a sub domain"
}

variable "parent_zone_id" {
  description = "The zone id of the parent hosted zone"
}

variable "subdomain_name" {
  description = "The subdomain name we are creating a hosted zone for"
}

variable "route53_tags" {
  description = "A map of tags for the Route53 resources"
  type        = map(any)
  default     = {}
}



# -------------------------------------------------------------
# -------------------------------------------------------------
#              ACM variables
# -------------------------------------------------------------
# -------------------------------------------------------------


variable "subject_alternative_names" {
  type        = any
  default     = []
  description = "Subject alternative domain names"
}

# variable "enabled" {
#   description = "Specify if we should generate ACM certificates"
#   default     = true
# }

# variable "hosted_zone_id" {
#   description = "route53 hosted zone id to create validation records within"
#   type        = string
# }







# -------------------------------------------------------------
# -------------------------------------------------------------
#               EKS variables
# -------------------------------------------------------------
# -------------------------------------------------------------

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "administration_cidrs" {
  description = "CIDR from Network account to manage eks cluster"
  default     = ["10.100.0.0/16"]
  type        = list(string)
}


variable "cluster_log_types" {
  description = "List of the cluster logs we want to enable"
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler", ]
  type        = list(string)
}

variable "endpoint_private_access" {
  description = "Configure eks api endpoint to be private"
  default     = true
  type        = bool
}

variable "endpoint_public_access" {
  description = "Configure eks api endpoint to be private"
  default     = true
  type        = bool
}

variable "subnet_ids" {
  description = "Subnets ids to place workers"
  default     = [""]
  type        = list(string)
}

variable "cluster_version" {
  description = "EKS control plane version"
  default     = "1.19"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type for worker nodes"
  default     = "m5.large"
  type        = string
}

variable "key_name" {
  description = "EC2 keypair for worker nodes"
  default     = ""
  type        = string
}

variable "vpc_id" {
  description = "VPC id where nodes will be placed"
  default     = ""
  type        = string
}

variable "cidr_block" {
  description = "VPC cidr block"
  default     = ""
  type        = string
}

variable "eks_tags" {
  default = {}
  type    = map(any)
}

variable "worker_node_policies" {
  type = list(string)

  default = [
    "AmazonEKSWorkerNodePolicy",
    "AmazonEKS_CNI_Policy",
    "AmazonEC2ContainerRegistryReadOnly",
    "CloudWatchAgentServerPolicy",
    "AmazonSSMManagedInstanceCore",
    "CloudWatchFullAccess"
  ]
}

variable "autoscaler_version" {
  default = "v1.20.0"
}

variable "ebs_kms" {
  default = ""
}

variable "worker" {
  type        = map(string)
  description = "Map of EKS workers settings"

  default = {
    instance_type         = "t3.minor"
    desired_size          = "2"
    min_size              = "1"
    max_size              = "4"
    key_name              = ""
    volume_size           = "30"
    encrypted             = true
    volume_type           = "gp2"
    delete_on_termination = true
  }
}

variable "tfcloud_user_arn" {
  description = "user ARN for terraform cloud"
}

variable "acc_admin_role" {
  description = "IAM role for DevOps access"
}
# -------------------------------------------------------------
# -------------------------------------------------------------
#               EKS plugins variables
# -------------------------------------------------------------
# -------------------------------------------------------------


variable "cluster_autoscaler_version" {
  # more info at https://artifacthub.io/packages/helm/cluster-autoscaler/cluster-autoscaler
  description = "helm chart version of cluster autoscaler"
  type        = string
  default     = "9.9.2"
}

variable "metric_server_version" {
  # more info at https://artifacthub.io/packages/helm/bitnami/metrics-server
  # official manifest https://github.com/kubernetes-sigs/external-dns
  description = "helm chart version of metrics server"
  type        = string
  default     = "5.8.7"
}

variable "external_dns_version" {
  # more info https://artifacthub.io/packages/helm/bitnami/external-dns
  # official manifest https://github.com/kubernetes-sigs/metrics-server/releases
  description = "helm chart version of external dns"
  type        = string
  default     = "5.0.0"
}

variable "plugins_namespace" {
  description = "kubernetes namespace for plugins to be allocated, default namespace should be avoided, using kube-system"
  type        = string
  default     = "kube-system"
}

variable "autoscaler_sa_name" {
  description = "kubernetes service account name for cluster autoscaler, this value has to match the one used in the role definition"
  type        = string
  default     = "aws-cluster-autoscaler"
}

variable "external_dns_sa_name" {
  description = "kubernetes service account name for external-dns, this value has to match the one used in the role definition"
  type        = string
  default     = "external-dns"
}

variable "aws_lb_controller_sa_name" {
  description = "kubernetes service account name for aws-lb-controller plugin, this value has to match the one used in the role definition"
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "aws_lb_controller_version" {
  # home of the chart https://aws.github.io/eks-charts
  description = "aws-lb-controller helm chart version"
  type        = string
  default     = "1.2.0"
}

variable "oidc_issuer" {
  description = "this is the oidc url used for the  used in IAM policies for trust relationships"
  type        = string
  default     = ""
}

variable "external_secrets_sa_name" {
  description = "kubernetes service account name for external-secrets, this value has to match the one used in the role definition"
  type        = string
  default     = "external-secrets"
}

variable "external_secrets_version" {
  # more info at https://github.com/external-secrets/kubernetes-external-secrets
  description = "helm chart version of external_secrets"
  type        = string
  default     = "8.1.2"
}

variable "argocd_enable" {
  default = false
}


variable "argocd_namespace" {
  # more info at https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd
  type    = string
  default = "argocd"
}

variable "argocd_version" {
  # more info at https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd
  type    = string
  default = "1.7.3"
}



# -------------------------------------------------------------
# -------------------------------------------------------------
#               ElasticCache Redis variables
# -------------------------------------------------------------
# -------------------------------------------------------------

# -------------------------------------------------------------
#  Global variables 
# -------------------------------------------------------------


variable "redis_enabled" {
  description = "A variable that indicates if module is enabled"
}

variable "redis_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

# -------------------------------------------------------------
# Network variables
# -------------------------------------------------------------

# variable "vpc_cidr" {
#   type        = list(string)
#   description = "A list the VPC CIDR that is going to be used for datastore deployment"
# }

# variable "vpc_id" {
#   description = "The id of the VPC that is going to be used for datastore deployment"
# }

# variable "subnet_ids" {
#   type        = list(string)
#   description = "A list of subnets that are going to be used for datastore deployment"
# }

# -------------------------------------------------------------
# Datastore variables
# -------------------------------------------------------------

variable "redis_cluster_id" {
  description = "The name of the cluster, group identifier. ElastiCache converts this name to lowercase"
}

variable "redis_engine" {
  description = "The name of the cache engine to be used for this cache cluster. Valid values for this parameter are memcached, redis or redis-cluster"
}

variable "redis_node_type" {
  description = "The compute and memory capacity of the nodes"
}

variable "redis_engine_version" {
  description = "Version number of the cache engine to be used"
}

variable "redis_maintenance_window" {
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC)"
}

variable "redis_parameter_group_name" {
  description = "The name of the parameter group to associate with this cache cluster"
  default     = ""
}

variable "redis_cache_parameters" {
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

variable "redis_port" {
  description = "The port number on which each of the cache nodes will accept connections. For Memcache the default is 11211, and for Redis the default port is 6379. "
}

variable "redis_num_cache_nodes" {
  description = "The initial number of cache nodes that the cache cluster will have. For Redis, this value must be 1. For Memcache, this value must be between 1 and 20"
  default     = 1
}

variable "redis_apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  default     = false
}

variable "redis_availability_zones" {
  description = "The Availability Zone for the cache cluster"
  type        = list(string)
  default     = []
}

# -------------------------------------------------------------
# Redis specific variables
# -------------------------------------------------------------

## NOTE: The snapshot window and maintenance window must not overlap
## NOTE: default = "" value is memcached safe
variable "redis_snapshot_window" {
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster"
  default     = ""
}

## NOTE: Not supported on cache.t1.micro or cache.t2.* nodes
## NOTE: default = "0" value is memcached safe
variable "redis_snapshot_retention_limit" {
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned "
  default     = 0
}

variable "redis_snapshot_arns" {
  description = "The arn from the s3 snapshot to launch the instance from"
  default     = [""]
}

# -------------------------------------------------------------
# Global Redis-cluster-mode disabled/enabled variables
# -------------------------------------------------------------

variable "redis_replication_group_description" {
  description = "A user-created description for the replication group"
  default     = "Managed by Terraform"
}

variable "redis_automatic_failover_enabled" {
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails"
  default     = true
}

variable "redis_at_rest_encryption_enabled" {
  description = "Whether to enable encryption at rest"
  default     = true
}

# NOTE: if you want to implement transit encryption, you must install stunnel in order to connect to the cluster
# for more info: https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/in-transit-encryption.html
variable "redis_transit_encryption_enabled" {
  description = "Whether to enable encryption in transit"
  default     = false
}

# -------------------------------------------------------------
# Redis-cluster-mode enabled specific variables
# -------------------------------------------------------------

variable "redis_replicas_per_node_group" {
  description = "Specify the number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource"
  default     = 1
}

variable "redis_num_node_groups" {
  description = "Specify the number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications."
  default     = 2
}

# -------------------------------------------------------------
# Redis cluster-mode disabled specific variables
# -------------------------------------------------------------

# NOTE: Primary has already been taken care
variable "redis_read_replicas" {
  description = "The number of cache clusters (replicas) this replication group will have"
  default     = 1
}

# -------------------------------------------------------------
# Security variables
# -------------------------------------------------------------

variable "redis_security_group_ids" {
  description = "One or more VPC security groups associated with the cache cluster"
  type        = list(string)
  default     = []
}

# -------------------------------------------------------------
# -------------------------------------------------------------
#               Amplify variables
# -------------------------------------------------------------
# -------------------------------------------------------------

variable "repository_url" {
  description = "The repository https url for the amplify app."
  type        = string
}

variable "branch" {
  description = "The branch to use on the amplify app."
  type        = string
}

variable "app_name" {
  description = "The amplify app name."
  type        = string
}

variable "amplify_domain_prefix" {
  description = "The domain prefix for the amplify app record."
  type        = string
  default     = "admin"
}


# -------------------------------------------------------------
# -------------------------------------------------------------
#               Nodechef variables
# -------------------------------------------------------------
# -------------------------------------------------------------

variable "nodechef_cluster_count" {
  type        = number
  description = "Number of instances for nodechef."
}

variable "nodechef_instance_size" {
  type        = string
  description = "Nodechef instance types."
}

# -------------------------------------------------------------
# -------------------------------------------------------------
#               XYZ variables
# -------------------------------------------------------------
# -------------------------------------------------------------