### The following block provision all the network resources on shared-services account
module "network" {
  source                  = "git@github.com:cenit-io/cenit-terraform.git//modules/vpc"
  environment             = var.environment
  region                  = var.region
  vpc_cidr                = var.vpc_cidr
  enable_dns_support      = var.enable_dns_support
  enable_dns_hostnames    = var.enable_dns_hostnames
  instance_tenancy        = var.instance_tenancy
  map_to_public_ip        = var.map_to_public_ip
  azs                     = var.azs
  public_subnet_cidrs     = var.public_subnet_cidrs
  private_subnet_cidrs    = var.private_subnet_cidrs
  db_subnet_cidrs         = var.db_subnet_cidrs
  enable_nat_gw           = var.enable_nat_gw
  single_nat_gw           = var.single_nat_gw
  enable_igw              = var.enable_nat_gw
  icmp_diagnostics_enable = var.icmp_diagnostics_enable
  enable_nacls            = var.enable_nacls
  # Tagging
  tags = {
    environment = var.cluster_name
    App         = "cenit"
  }

  # Tags needed for EKS to identify public and private subnets
  eks_network_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  eks_private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }

  eks_public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

  create_transit_gw            = var.create_transit_gw
  share_transit_gw             = var.share_transit_gw
  remote_transit_gw            = var.remote_transit_gw
  transit_gw_cidr              = var.transit_gw_cidr
  use_transit_gw               = var.use_transit_gw
  transit_gw_id                = var.transit_gw_id
  transit_gw_arn               = var.transit_gw_arn
  transit_gw_rt_id             = var.transit_gw_rt_id
  transit_gw_share_arn         = var.transit_gw_share_arn
  transit_gw_association_rt_id = var.transit_gw_association_rt_id
  transit_gw_propagation_rt_id = var.transit_gw_propagation_rt_id
  # default_route_table_association = var.default_route_table_association        
  # default_route_table_propagation = var.default_route_table_propagation       
  description                    = var.tgw_description
  auto_accept_shared_attachments = var.auto_accept_shared_attachments
  allow_external_principals      = var.allow_external_principals
  vpn_ecmp_support               = var.vpn_ecmp_support
  shared_with_root_org           = var.shared_with_root_org
  root_organization_arn          = var.root_organization_arn
}

### The following block provision the hosted zone for the subdomain.
module "R53_public_hz_subdomain" {
  source             = "git@github.com:cenit-io/cenit-terraform.git//modules/route53/subdomain"
  create_hosted_zone = var.create_hosted_zone
  delegate_subdomain = var.delegate_subdomain
  domain_name        = var.domain_name
  parent_zone_id     = var.parent_zone_id
  subdomain_name     = var.subdomain_name
  environment        = var.environment
  tags               = var.route53_tags
}

# ### The following block provision the certificates for the subdomain.
module "acm" {
  # more info --> https://registry.terraform.io/modules/terraform-aws-modules/acm/aws/latest
  source                    = "terraform-aws-modules/acm/aws"
  domain_name               = module.R53_public_hz_subdomain.fqdn
  zone_id                   = module.R53_public_hz_subdomain.zone_id
  wait_for_validation       = true
  subject_alternative_names = var.subject_alternative_names
  tags = {
    Name = module.R53_public_hz_subdomain.fqdn
  }
  depends_on = [module.R53_public_hz_subdomain]
}

### The following block provision the EKS cluster
module "eks" {
  source                  = "git@github.com:cenit-io/cenit-terraform.git//modules/eks"
  cluster_name            = var.cluster_name
  administration_cidrs    = var.administration_cidrs
  cluster_log_types       = var.cluster_log_types
  endpoint_private_access = var.endpoint_private_access
  endpoint_public_access  = var.endpoint_public_access
  subnet_ids              = module.network.private_subnet_ids
  cluster_version         = var.cluster_version
  environment             = var.environment
  instance_type           = var.instance_type
  key_name                = var.key_name
  vpc_id                  = module.network.vpc_id
  cidr_block              = module.network.vpc_cidr
  tags                    = var.eks_tags
  worker_node_policies    = var.worker_node_policies
  autoscaler_version      = var.autoscaler_version
  ebs_kms                 = var.ebs_kms
  worker                  = var.worker
  map_users = [
    {
      user_arn = var.tfcloud_user_arn
      username = "tfcloud"
      group    = "system:masters" # cluster-admin
    }
  ]
  map_roles = [
    {
      role_arn = var.acc_admin_role
      username = "admin:{{SessionName}}"
      group    = "system:masters" # cluster-admin
    }
  ]
}

data "aws_ssm_parameter" "nri_license_key" {
  name = "/CENIT/NRIA_LICENSE_KEY"
}

### The following block provision the EKS plugins
module "eks_plugins" {
  source                     = "git@github.com:cenit-io/cenit-terraform.git//modules/helm_eks_plugins"
  region                     = var.region
  plugins_namespace          = var.plugins_namespace
  autoscaler_sa_name         = var.autoscaler_sa_name
  external_dns_sa_name       = var.external_dns_sa_name
  cluster_autoscaler_version = var.cluster_autoscaler_version
  external_dns_version       = var.external_dns_version
  metric_server_version      = var.metric_server_version
  oidc_issuer                = module.eks.oidc_issuer
  environment                = var.environment
  external_secrets_sa_name   = var.external_secrets_sa_name
  external_secrets_version   = var.external_secrets_version
  new_relic_license_key      = data.aws_ssm_parameter.nri_license_key.value
  argocd_enable              = var.argocd_enable
  argocd_namespace           = var.argocd_namespace
  argocd_version             = var.argocd_version
  cluster_endpoint           = module.eks.endpoint
  cluster_ca_cert            = module.eks.ca
  cluster_name               = module.eks.cluster_name
}

# ## The following block provision the Cloudwatch dashboards 
# module "cloudwatch" {
#   source                 = "git@github.com:cenit-io/cenit-terraform.git//modules/cloudwatch"
#   cluster_name           = var.cluster_name
#   env                    = var.environment
#   vpc_id                 = module.network.vpc_id
#   amplify_app_id         = module.amplify-app.amplify_app_id
#   enable_eks_metrics     = true
#   enable_amplify_metrics = true
# }

# The following block provision the ElasticCache Redis database  
module "elasticcache_redis" {
  source               = "git@github.com:cenit-io/cenit-terraform.git//modules/elasticcache_redis"
  enabled              = var.redis_enabled
  tags                 = var.redis_tags
  environment          = var.environment
  vpc_cidr             = [module.network.vpc_cidr]
  vpc_id               = module.network.vpc_id
  subnet_ids           = module.network.db_subnet_ids
  cluster_id           = var.redis_cluster_id
  engine               = var.redis_engine
  engine_version       = var.redis_engine_version
  node_type            = var.redis_node_type
  maintenance_window   = var.redis_maintenance_window
  parameter_group_name = var.redis_parameter_group_name
  cache_parameters     = var.redis_cache_parameters
  port                 = var.redis_port
  # num_cache_nodes               = var.redis_num_cache_nodes 
  # apply_immediately             = var.redis_apply_immediately
  availability_zones = module.network.azs
  # snapshot_window               = var.redis_snapshot_window
  # snapshot_retention_limit      = var.redis_snapshot_retention_limit
  # snapshot_arns                 = var.redis_snapshot_arns
  # replication_group_description = var.redis_replication_group_description
  # automatic_failover_enabled    = var.redis_automatic_failover_enabled
  # at_rest_encryption_enabled    = var.redis_at_rest_encryption_enabled
  # transit_encryption_enabled    = var.redis_at_rest_encryption_enabled
  # replicas_per_node_group       = var.redis_replicas_per_node_group
  # num_node_groups               = var.redis_num_node_groups
  # read_replicas                 = var.redis_read_replicas
  # security_group_ids            = var.redis_security_group_ids

}

module "amplify-app" {
  source         = "git@github.com:cenit-io/cenit-terraform.git//modules/amplify"
  app_name       = "${var.app_name}-${var.environment}"
  domain_prefix  = var.amplify_domain_prefix
  repository_url = var.repository_url
  branch         = var.branch
  domain         = "${var.subdomain_name}.${var.domain_name}"
  env_vars       = { "NEW_RELIC_APP_NAME" = "${var.app_name}-${var.environment}", "NEW_RELIC_LICENSE_KEY" = data.aws_ssm_parameter.nri_license_key.value }
}

# CDN for cenit
module "static_assets" {
  source = "git@github.com:cenit-io/cenit-terraform.git//modules/cloudfront"
  # General settings
  environment         = var.cluster_name
  create_distribution = true
  description         = "CloudFront distribution for static assets"
  distribution_class  = "PriceClass_All"
  shared_account_id   = var.shared_account_id

  # Logging
  # s3_bucket_access_logs = "${aws_s3_bucket.cloudfront_logs.id}.s3.amazonaws.com"
  # s3_access_logs_prefix = "static_assets/"
  logging_enabled = false
  log_cookies     = false

  # Security
  certificate_arn = module.acm.acm_certificate_arn
  # minimum_ssl_tls_version = "TLSv1.1_2016"
  # waf_acl_id              = var.prod_cdn_waf_enabled ? module.cdn_waf.waf_arn : ""

  # route53 record set
  route53_alias_record = true
  route53_zone_id      = module.R53_public_hz_subdomain.zone_id
  domain               = module.R53_public_hz_subdomain.fqdn
  alias                = ["static.${var.subdomain_name}.cenit.io"]

  # Default cache behavior settings
  default_cache_origin_id             = "S3"
  default_cache_access_protocol       = "redirect-to-https"
  default_cache_allowed_http_methods  = ["GET", "HEAD"]
  default_cache_cached_methods        = ["GET", "HEAD"]
  default_cache_forward_query_strings = true
  default_cache_forward_cookies       = "none"
  default_cache_headers_caching       = ["Access-Control-Request-Headers", "Access-Control-Request-Method", "Origin"]
  default_root_object                 = ""

  # tagging
  tags = {
    environment = var.cluster_name
  }
}

module "nodechef" {
  source                  = "git@github.com:cenit-io/cenit-terraform.git//modules/nodechef"
  nodechef_cluster_count  = var.nodechef_cluster_count
  keypair_name            = "nodechef"
  vpc_id                  = module.network.vpc_id
  vpc_cidr_block          = var.vpc_cidr
  instance_type           = var.nodechef_instance_size
  subnet_ids              = module.network.public_subnet_ids
  nat_gateway_ips         = module.network.eip_nat_gateways
  disable_api_termination = true
}

module "mq" {
  source     = "git@github.com:cenit-io/cenit-terraform.git//modules/mq"
  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.public_subnet_ids[0]
}
