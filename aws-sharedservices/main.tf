

### The following file provision all the network resources on shared-services account
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
  tags                    = var.tags
  eks_network_tags        = var.eks_network_tags
  eks_private_subnet_tags = var.eks_private_subnet_tags


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

data "aws_iam_policy_document" "ecr_access" {
  policy_id = "ECR_access_from_cicd"
  version   = "2012-10-17"
  statement {
    sid    = "ecrAccess"
    effect = "Allow"
    actions = [
      "ecr:PutImageTagMutability",
      "ecr:StartImageScan",
      "ecr:ListTagsForResource",
      "ecr:UploadLayerPart",
      "ecr:ListImages",
      "ecr:PutRegistryPolicy",
      "ecr:CompleteLayerUpload",
      "ecr:TagResource",
      "ecr:DescribeRepositories",
      "ecr:BatchCheckLayerAvailability",
      "ecr:ReplicateImage",
      "ecr:GetLifecyclePolicy",
      "ecr:GetRegistryPolicy",
      "ecr:PutLifecyclePolicy",
      "ecr:DescribeImageScanFindings",
      "ecr:GetLifecyclePolicyPreview",
      "ecr:CreateRepository",
      "ecr:DescribeRegistry",
      "ecr:PutImageScanningConfiguration",
      "ecr:GetDownloadUrlForLayer",
      "ecr:PutImage",
      "ecr:UntagResource",
      "ecr:SetRepositoryPolicy",
      "ecr:BatchGetImage",
      "ecr:DescribeImages",
      "ecr:StartLifecyclePolicyPreview",
      "ecr:InitiateLayerUpload",
      "ecr:GetRepositoryPolicy",
      "ecr:PutReplicationConfiguration"
    ]
    resources = ["arn:aws:ecr:us-east-1:035696680276:repository/cenit_server"]
  }
  statement {
    sid    = "ecrAccessAllResources"
    effect = "Allow"
    actions = [
      "ecr:GetAuthorizationToken"
    ]
    resources = ["*"]
  }
  statement {
    sid    = "s3Access"
    effect = "Allow"
    actions = [
      "s3:List*",
      "s3:Put*"
    ]
    resources = [
      "arn:aws:s3:::cenit-static-assets-*/*",
      "arn:aws:s3:::cenit-static-assets-*"
    ]
  }
}

resource "aws_iam_user" "circle_ci_user" {
  name = "circle-ci-access"
  path = "/"
}

resource "aws_iam_access_key" "circle_ci_access_keys" {
  user = aws_iam_user.circle_ci_user.name
}

resource "aws_ssm_parameter" "circle_ci_access_key_id" {
  name        = upper("CIRCLE_CI_ACCESS_KEY")
  description = "circle_ci access key id to be used by circle ci"
  type        = "SecureString"
  value       = aws_iam_access_key.circle_ci_access_keys.id
}

resource "aws_ssm_parameter" "circle_ci_secret_access_key_id" {
  name        = upper("CIRCLE_CI_SECRET_ACCESS_KEY")
  description = "circle_ci secret access key id to be used by circle ci"
  type        = "SecureString"
  value       = aws_iam_access_key.circle_ci_access_keys.secret
}

resource "aws_iam_user_policy" "circle-ci-access-ecr-policy" {
  name   = "ecr_s3_access_policy"
  user   = aws_iam_user.circle_ci_user.name
  policy = data.aws_iam_policy_document.ecr_access.json
}
