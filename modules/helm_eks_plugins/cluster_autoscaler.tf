### Using helm provider we install the following helm chart to apply the cluster autoscaler plugin into the eks cluster
### The items below are the required roles and policies for this to work properly with irsa authentication and roles
### We set the variables required for this to work properly, you can find more details at the chart definition
### https://artifacthub.io/packages/helm/cluster-autoscaler/cluster-autoscaler

data "template_file" "cluster_autoscaler" {
  template = file("${path.module}/helm_values/cluster-autoscaler/values.yaml.tpl")
}

resource "helm_release" "cluster_autoscaler" {
  name            = "cluster-autoscaler"
  repository      = "https://kubernetes.github.io/autoscaler"
  chart           = "cluster-autoscaler"
  values          = [data.template_file.cluster_autoscaler.rendered]
  version         = var.cluster_autoscaler_version
  namespace       = var.plugins_namespace
  cleanup_on_fail = true

  set {
    type  = "string"
    name  = "autoDiscovery.clusterName"
    value = var.cluster_name
  }
  set {
    type  = "string"
    name  = "awsRegion"
    value = var.region
  }
  set {
    name  = "rbac.create"
    value = true
  }
  set {
    type  = "string"
    name  = "rbac.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.cluster_autoscaler_role.iam_role_arn
  }
  set {
    type  = "string"
    name  = "rbac.serviceAccount.name"
    value = var.autoscaler_sa_name
  }

  depends_on = [
    null_resource.wait_for_kubeconfig,
    module.cluster_autoscaler_role,
    aws_iam_policy.cluster_autoscaler
  ]
}

### Role creation with OIDC support for specific service account and namespace
module "cluster_autoscaler_role" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version                       = "4.1.0"
  create_role                   = true
  role_name                     = "${var.environment}-cluster-autoscaler-${var.cluster_name}"
  provider_url                  = var.oidc_issuer
  role_policy_arns              = [aws_iam_policy.cluster_autoscaler.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${var.plugins_namespace}:${var.autoscaler_sa_name}"]
}

### AWS IAM policy for the cluster autoscaler, this comes from the aws_iam_policy_document.worker_autoscaling
resource "aws_iam_policy" "cluster_autoscaler" {
  name_prefix = "${var.environment}-cluster-autoscaler-${var.cluster_name}"
  description = "EKS worker node autoscaling policy for cluster ${var.cluster_name}"
  policy      = data.aws_iam_policy_document.worker_autoscaling.json
}


data "aws_iam_policy_document" "worker_autoscaling" {
  statement {
    sid    = "clusterAutoscalerAll"
    effect = "Allow"

    actions = [
      "autoscaling:DescribeAutoScalingGroups",
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeLaunchConfigurations",
      "autoscaling:DescribeTags",
      "ec2:DescribeLaunchTemplateVersions",
    ]

    resources = ["*"]
  }

  statement {
    sid    = "clusterAutoscalerOwn"
    effect = "Allow"

    actions = [
      "autoscaling:SetDesiredCapacity",
      "autoscaling:TerminateInstanceInAutoScalingGroup",
      "autoscaling:UpdateAutoScalingGroup",
    ]

    resources = ["*"]

    condition {
      test     = "StringEquals"
      variable = "autoscaling:ResourceTag/kubernetes.io/cluster/${var.cluster_name}"
      values   = ["owned"]
    }

    condition {
      test     = "StringEquals"
      variable = "autoscaling:ResourceTag/k8s.io/cluster-autoscaler/enabled"
      values   = ["true"]
    }
  }
}
