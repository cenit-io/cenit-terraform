### Using helm provider we install the following helm chart to apply the external-dns plugin into the eks cluster
### The items below are the required roles and policies for this to work properly with irsa authentication and roles
### We set the variables required for this to work properly, you can find more details at the chart definition
### https://artifacthub.io/packages/helm/bitnami/external-dns

resource "helm_release" "external_dns" {
  name            = "external-dns"
  repository      = "https://charts.bitnami.com/bitnami"
  chart           = "external-dns"
  namespace       = var.plugins_namespace
  version         = var.external_dns_version
  cleanup_on_fail = true

  set {
    type  = "string"
    name  = "provider"
    value = "aws"
  }
  set {
    type  = "string"
    name  = "aws.zoneType"
    value = "public"
  }
  set {
    name  = "serviceAccount.name"
    value = var.external_dns_sa_name
  }
  set {
    type  = "string"
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.external_dns_role.iam_role_arn
  }
  set {
    type  = "auto"
    name  = "podSecurityContext.fsGroup"
    value = 65534
  }
  set {
    type  = "auto"
    name  = "podSecurityContext.runAsUser"
    value = 0
  }

  depends_on = [
    null_resource.wait_for_kubeconfig,
    module.external_dns_role,
    aws_iam_policy.external_dns
  ]
}

### Role creation with OIDC support for specific service account and namespace
module "external_dns_role" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version                       = "4.1.0"
  create_role                   = true
  role_name                     = "${var.environment}-external-dns-${var.cluster_name}"
  provider_url                  = var.oidc_issuer
  role_policy_arns              = [aws_iam_policy.external_dns.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${var.plugins_namespace}:${var.external_dns_sa_name}"]
}

### AWS IAM policy for the external-dns, this comes from the aws_iam_policy_document.external_dns
resource "aws_iam_policy" "external_dns" {
  name_prefix = "${var.environment}-external-dns-${var.cluster_name}"
  description = "Route 53 dns record management policy for cluster ${var.cluster_name}"
  policy      = data.aws_iam_policy_document.external_dns.json
}

data "aws_iam_policy_document" "external_dns" {
  statement {

    effect = "Allow"

    actions = [
      "route53:ListHostedZones",
      "route53:ListResourceRecordSets",
      "route53:ChangeResourceRecordSets",
    ]

    resources = ["*"]
  }
}
