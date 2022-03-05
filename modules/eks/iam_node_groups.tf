resource "aws_iam_role" "eks-nodegroup-NodeInstanceRole" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "ec2.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "${var.environment}-eks-nodegroup-NodeInstanceRole"
  path                  = "/"
  tags = {
    "Name" = "${var.environment}-eks-nodegroup-ng/NodeInstanceRole"
  }
}

resource "aws_iam_role_policy" "eks-nodegroup-NodeInstanceRole-PolicyALBIngress" {
  name = "${var.environment}-eks-nodegroup-PolicyALBIngress"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "acm:DescribeCertificate",
            "acm:ListCertificates",
            "acm:GetCertificate",
            "ec2:AuthorizeSecurityGroupIngress",
            "ec2:CreateSecurityGroup",
            "ec2:CreateTags",
            "ec2:DeleteTags",
            "ec2:DeleteSecurityGroup",
            "ec2:DescribeAccountAttributes",
            "ec2:DescribeAddresses",
            "ec2:DescribeInstances",
            "ec2:DescribeInstanceStatus",
            "ec2:DescribeInternetGateways",
            "ec2:DescribeNetworkInterfaces",
            "ec2:DescribeSecurityGroups",
            "ec2:DescribeSubnets",
            "ec2:DescribeTags",
            "ec2:DescribeVpcs",
            "ec2:ModifyInstanceAttribute",
            "ec2:ModifyNetworkInterfaceAttribute",
            "ec2:RevokeSecurityGroupIngress",
            "elasticloadbalancing:AddListenerCertificates",
            "elasticloadbalancing:AddTags",
            "elasticloadbalancing:CreateListener",
            "elasticloadbalancing:CreateLoadBalancer",
            "elasticloadbalancing:CreateRule",
            "elasticloadbalancing:CreateTargetGroup",
            "elasticloadbalancing:DeleteListener",
            "elasticloadbalancing:DeleteLoadBalancer",
            "elasticloadbalancing:DeleteRule",
            "elasticloadbalancing:DeleteTargetGroup",
            "elasticloadbalancing:DeregisterTargets",
            "elasticloadbalancing:DescribeListenerCertificates",
            "elasticloadbalancing:DescribeListeners",
            "elasticloadbalancing:DescribeLoadBalancers",
            "elasticloadbalancing:DescribeLoadBalancerAttributes",
            "elasticloadbalancing:DescribeRules",
            "elasticloadbalancing:DescribeSSLPolicies",
            "elasticloadbalancing:DescribeTags",
            "elasticloadbalancing:DescribeTargetGroups",
            "elasticloadbalancing:DescribeTargetGroupAttributes",
            "elasticloadbalancing:DescribeTargetHealth",
            "elasticloadbalancing:ModifyListener",
            "elasticloadbalancing:ModifyLoadBalancerAttributes",
            "elasticloadbalancing:ModifyRule",
            "elasticloadbalancing:ModifyTargetGroup",
            "elasticloadbalancing:ModifyTargetGroupAttributes",
            "elasticloadbalancing:RegisterTargets",
            "elasticloadbalancing:RemoveListenerCertificates",
            "elasticloadbalancing:RemoveTags",
            "elasticloadbalancing:SetIpAddressType",
            "elasticloadbalancing:SetSecurityGroups",
            "elasticloadbalancing:SetSubnets",
            "elasticloadbalancing:SetWebACL",
            "iam:CreateServiceLinkedRole",
            "iam:GetServerCertificate",
            "iam:ListServerCertificates",
            "waf-regional:GetWebACLForResource",
            "waf-regional:GetWebACL",
            "waf-regional:AssociateWebACL",
            "waf-regional:DisassociateWebACL",
            "tag:GetResources",
            "tag:TagResources",
            "waf:GetWebACL",
            "wafv2:GetWebACL",
            "wafv2:GetWebACLForResource",
            "wafv2:AssociateWebACL",
            "wafv2:DisassociateWebACL",
            "shield:DescribeProtection",
            "shield:GetSubscriptionState",
            "shield:DeleteProtection",
            "shield:CreateProtection",
            "shield:DescribeSubscription",
            "shield:ListProtections",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-NodeInstanceRole.id
}

resource "aws_iam_role_policy" "eks-nodegroup-NodeInstanceRole-PolicyAutoScaling" {
  name = "${var.environment}-eks-nodegroup-PolicyAutoScaling"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "autoscaling:DescribeAutoScalingGroups",
            "autoscaling:DescribeAutoScalingInstances",
            "autoscaling:DescribeLaunchConfigurations",
            "autoscaling:DescribeTags",
            "autoscaling:SetDesiredCapacity",
            "autoscaling:TerminateInstanceInAutoScalingGroup",
            "ec2:DescribeLaunchTemplateVersions",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-NodeInstanceRole.id
}


resource "aws_iam_role_policy" "eks-nodegroup-NodeInstanceRole-PolicyCertManagerChangeSet" {
  name = "${var.environment}-eks-nodegroup-PolicyCertManagerChangeSet"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "route53:ChangeResourceRecordSets",
          ]
          Effect   = "Allow"
          Resource = "arn:aws:route53:::hostedzone/*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-NodeInstanceRole.id
}

resource "aws_iam_role_policy" "eks-nodegroup-NodeInstanceRole-PolicyCertManagerGetChange" {
  name = "${var.environment}-eks-nodegroup-PolicyCertManagerGetChange"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "route53:GetChange",
          ]
          Effect   = "Allow"
          Resource = "arn:aws:route53:::change/*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-NodeInstanceRole.id
}

resource "aws_iam_role_policy" "eks-nodegroup-NodeInstanceRole-PolicyCertManagerHostedZones" {
  name = "${var.environment}-eks-nodegroup-PolicyCertManagerHostedZones"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "route53:ListResourceRecordSets",
            "route53:ListHostedZonesByName",
            "route53:ListHostedZones",
            "route53:ListTagsForResource",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-NodeInstanceRole.id
}


resource "aws_iam_role_policy" "eks-nodegroup-NodeInstanceRole-PolicyEBS" {
  name = "${var.environment}-eks-nodegroup-PolicyEBS"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "ec2:AttachVolume",
            "ec2:CreateSnapshot",
            "ec2:CreateTags",
            "ec2:CreateVolume",
            "ec2:DeleteSnapshot",
            "ec2:DeleteTags",
            "ec2:DeleteVolume",
            "ec2:DescribeAvailabilityZones",
            "ec2:DescribeInstances",
            "ec2:DescribeSnapshots",
            "ec2:DescribeTags",
            "ec2:DescribeVolumes",
            "ec2:DescribeVolumesModifications",
            "ec2:DetachVolume",
            "ec2:ModifyVolume",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-NodeInstanceRole.id
}

resource "aws_iam_role_policy" "eks-nodegroup-NodeInstanceRole-PolicyECR" {
  name = "${var.environment}-eks-nodegroup-PolicyECR"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "ecr:BatchGetImage",
            "ecr:BatchCheckLayerAvailability",
            "ecr:PutImage",
            "ecr:InitiateLayerUpload",
            "ecr:UploadLayerPart",
            "ecr:CompleteLayerUpload"
          ]
          Effect   = "Allow"
          Resource = var.ecr_repositories
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-NodeInstanceRole.id
}

resource "aws_iam_role_policy_attachment" "eks-WorkerPolicies" {
  for_each   = toset(var.worker_node_policies)
  policy_arn = "arn:aws:iam::aws:policy/${each.key}"
  role       = aws_iam_role.eks-nodegroup-NodeInstanceRole.name
}

resource "aws_iam_role_policy_attachment" "eks-nodegroup-AmazonEC2RoleforSSM" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  role       = aws_iam_role.eks-nodegroup-NodeInstanceRole.id
}
