### Using helm provider we install the following helm chart to apply the aws load balancer controller plugin into the eks cluster
### The items below are the required roles and policies for this to work properly with irsa authentication and roles
### We set the variables required for this to work properly, you can find more details at the installation of this tool below
### https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/deploy/installation/

resource "helm_release" "aws_lb_controller" {
  name            = "aws-load-balancer-controller"
  repository      = "https://aws.github.io/eks-charts"
  chart           = "aws-load-balancer-controller"
  version         = var.aws_lb_controller_version
  namespace       = var.plugins_namespace
  cleanup_on_fail = true

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "serviceAccount.create"
    value = true
  }

  set {
    name  = "serviceAccount.name"
    value = var.aws_lb_controller_sa_name
  }

  set {
    type  = "string"
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.aws_lb_controller_role.iam_role_arn
  }

  depends_on = [
    null_resource.wait_for_kubeconfig
  ]
}

### Role creation with OIDC support for specific service account and namespace
module "aws_lb_controller_role" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version                       = "4.1.0"
  create_role                   = true
  role_name                     = "${var.environment}-aws-lb-controller-${var.cluster_name}"
  provider_url                  = var.oidc_issuer
  role_policy_arns              = [aws_iam_policy.aws_lb_controller.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${var.plugins_namespace}:${var.aws_lb_controller_sa_name}"]
}

### AWS IAM policy for the aws lb controller, this comes from the http.aws_alb_controller_policy
resource "aws_iam_policy" "aws_lb_controller" {
  name_prefix = "${var.environment}-aws-lb-controller-${var.cluster_name}"
  description = "policy required for aws lb controller for cluster ${var.cluster_name}"
  policy      = data.http.aws_alb_controller_policy.body
}

### ToDO change this to a parameter to make it easier to be updated
data "http" "aws_alb_controller_policy" {
  url = "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.2.0/docs/install/iam_policy.json"

  request_headers = {
    Accept = "application/json"
  }
}
