## external-secret

resource "helm_release" "external_secrets" {
  name            = "external-secrets"
  repository      = "https://external-secrets.github.io/kubernetes-external-secrets/"
  chart           = "kubernetes-external-secrets"
  version         = var.external_secrets_version
  namespace       = var.plugins_namespace
  cleanup_on_fail = true

  set {
    type  = "string"
    name  = "env.AWS_REGION"
    value = var.region
  }

  set {
    type  = "string"
    name  = "env.AWS_DEFAULT_REGION"
    value = var.region
  }

  set {
    name  = "rbac.create"
    value = true
  }

  set {
    type  = "string"
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.external_secrets_role.iam_role_arn
  }

  set {
    type  = "string"
    name  = "serviceAccount.name"
    value = var.external_secrets_sa_name
  }

  depends_on = [
    null_resource.wait_for_kubeconfig,
    module.external_secrets_role,
    aws_iam_policy.external_secrets
  ]

}

### Role creation with OIDC support for specific service account and namespace
module "external_secrets_role" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version                       = "4.1.0"
  create_role                   = true
  role_name                     = "${var.environment}-external-secrets-${var.cluster_name}"
  provider_url                  = var.oidc_issuer
  role_policy_arns              = [aws_iam_policy.external_secrets.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${var.plugins_namespace}:${var.external_secrets_sa_name}"]
}

### AWS IAM policy for the external_secrets, this comes from the aws_iam_policy_document.external_secrets
resource "aws_iam_policy" "external_secrets" {
  name_prefix = "${var.environment}-external-secrets-${var.cluster_name}"
  description = "EKS worker node external_secrets policy for cluster ${var.cluster_name}"
  policy      = data.aws_iam_policy_document.external_secrets.json
}


data "aws_iam_policy_document" "external_secrets" {
  statement {

    effect = "Allow"

    actions = [
      "ssm:*",
      "kms:*"
    ]

    resources = ["*"]
  }
}
