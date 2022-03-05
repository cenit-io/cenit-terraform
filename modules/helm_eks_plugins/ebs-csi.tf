## aws-ebs-csi  . https://artifacthub.io/packages/helm/particuleio/aws-ebs-csi-driver/0.9.4

resource "helm_release" "ebs-csi" {
  name            = "ebs-csi"
  repository      = "https://particuleio.github.io/charts"
  chart           = "aws-ebs-csi-driver"
  version         = var.ebs_csi_version
  namespace       = var.plugins_namespace
  cleanup_on_fail = true

  set {
    type  = "string"
    name  = "controller.region"
    value = var.region
  }

  set {
    type  = "string"
    name  = "controller.containerResources.limits.cpu"
    value = var.ebs_containerResources_limits_cpu
  }

  set {
    type  = "string"
    name  = "controller.containerResources.limits.memory"
    value = var.ebs_containerResources_limits_memory
  }

  set {
    type  = "string"
    name  = "controller.containerResources.requests.cpu"
    value = var.ebs_containerResources_requests_cpu
  }

  set {
    type  = "string"
    name  = "controller.containerResources.requests.memory"
    value = var.ebs_containerResources_requests_memory
  }

  set {
    name  = "enableVolumeResizing"
    value = true
  }

  set {
    name  = "enableVolumeSnapshot"
    value = true
  }

  set {
    name  = "serviceAccount.controller.create"
    value = true # A service account will be created for you if set to true. Set to false if you want to use your own.
  }

  set {
    name  = "serviceAccount.snapshot.create"
    value = true # A service account will be created for you if set to true. Set to false if you want to use your own.
  }

  set {
    name  = "serviceAccount.node.create"
    value = true # A service account will be created for you if set to true. Set to false if you want to use your own.
  }

  set {
    type  = "string"
    name  = "serviceAccount.controller.name"
    value = var.ebs_csi_controller_sa_name
  }

  set {
    type  = "string"
    name  = "serviceAccount.snapshot.name"
    value = var.ebs_csi_snapshot_sa_name
  }

  set {
    type  = "string"
    name  = "serviceAccount.node.name"
    value = var.ebs_csi_node_sa_name
  }

  depends_on = [
    null_resource.wait_for_kubeconfig,
    module.ebs_csi_role,
    aws_iam_policy.ebs_csi
  ]
}

### Role creation with OIDC support for specific service account and namespace
module "ebs_csi_role" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version                       = "4.1.0"
  create_role                   = true
  role_name                     = "${var.environment}-ebs-csi-${var.cluster_name}"
  provider_url                  = var.oidc_issuer
  role_policy_arns              = [aws_iam_policy.ebs_csi.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${var.plugins_namespace}:${var.ebs_csi_controller_sa_name}", "system:serviceaccount:${var.plugins_namespace}:${var.ebs_csi_snapshot_sa_name}", "system:serviceaccount:${var.plugins_namespace}:${var.ebs_csi_node_sa_name}"]
}

### AWS IAM policy for the ebs_csi, this comes from the aws_iam_policy_document.ebs_csi
resource "aws_iam_policy" "ebs_csi" {
  name_prefix = "${var.environment}-ebs-csi-${var.cluster_name}"
  description = "EKS worker node ebs-csi policy for cluster ${var.cluster_name}"
  policy      = data.aws_iam_policy_document.ebs_csi.json
}


data "aws_iam_policy_document" "ebs_csi" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:CreateSnapshot",
      "ec2:AttachVolume",
      "ec2:DetachVolume",
      "ec2:ModifyVolume",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeInstances",
      "ec2:DescribeSnapshots",
      "ec2:DescribeTags",
      "ec2:DescribeVolumes",
      "ec2:DescribeVolumesModifications"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "ec2:CreateTags"
    ]
    resources = [
      "arn:aws:ec2:*:*:volume/*",
      "arn:aws:ec2:*:*:snapshot/*"
    ]
    condition {
      test     = "StringEquals"
      variable = "ec2:CreateAction"
      values = [
        "CreateVolume",
        "CreateSnapshot"
      ]
    }
  }
  statement {
    effect = "Allow"
    actions = [
      "ec2:DeleteTags"
    ]
    resources = [
      "arn:aws:ec2:*:*:volume/*",
      "arn:aws:ec2:*:*:snapshot/*"
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "ec2:CreateVolume"
    ]
    resources = ["*"]
    condition {
      test     = "StringLike"
      variable = "aws:RequestTag/ebs.csi.aws.com/cluster"
      values   = ["true"]
    }
  }
  statement {
    effect = "Allow"
    actions = [
      "ec2:CreateVolume"
    ]
    resources = ["*"]
    condition {
      test     = "StringLike"
      variable = "aws:RequestTag/CSIVolumeName"
      values   = ["*"]
    }
  }
  statement {
    effect = "Allow"
    actions = [
      "ec2:DeleteVolume"
    ]
    resources = ["*"]
    condition {
      test     = "StringLike"
      variable = "ec2:resourceTag/CSIVolumeName"
      values   = ["*"]
    }
  }
  statement {
    effect = "Allow"
    actions = [
      "ec2:DeleteVolume"
    ]
    resources = ["*"]
    condition {
      test     = "StringLike"
      variable = "ec2:resourceTag/ebs.csi.aws.com/cluster"
      values   = ["true"]
    }
  }
  statement {
    effect = "Allow"
    actions = [
      "ec2:DeleteSnapshot"
    ]
    resources = ["*"]
    condition {
      test     = "StringLike"
      variable = "ec2:resourceTag/CSIVolumeSnapshotName"
      values   = ["*"]
    }
  }
  statement {
    effect = "Allow"
    actions = [
      "ec2:DeleteSnapshot"
    ]
    resources = ["*"]
    condition {
      test     = "StringLike"
      variable = "ec2:resourceTag/ebs.csi.aws.com/cluster"
      values   = ["true"]
    }
  }
}
