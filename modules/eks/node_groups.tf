data "aws_ssm_parameter" "eksami" {
  name = format("/aws/service/eks/optimized-ami/%s/amazon-linux-2/recommended/image_id", aws_eks_cluster.cluster.version)
}

resource "aws_ebs_encryption_by_default" "worker_ebs" {
  enabled = true
}

resource "aws_ebs_default_kms_key" "worker_ebs" {
  key_arn = var.ebs_kms
}

resource "aws_launch_template" "lt-ng1" {
  instance_type          = var.worker["instance_type"]
  key_name               = var.worker["key_name"]
  name                   = format("${var.environment}-lt-%s-ng1", aws_eks_cluster.cluster.name)
  tags                   = local.default_tags
  image_id               = data.aws_ssm_parameter.eksami.value
  user_data              = base64encode(local.eks-node-private-userdata)
  vpc_security_group_ids = [aws_security_group.allnodes-sg.id]
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = var.worker["volume_size"]
      encrypted             = var.worker["encrypted"]
      volume_type           = var.worker["volume_type"]
      delete_on_termination = var.worker["delete_on_termination"]
      kms_key_id            = var.ebs_kms
    }
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = format("%s-ng1-${var.environment}", aws_eks_cluster.cluster.name)
    }
  }
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [image_id, latest_version]
  }
}

resource "aws_eks_node_group" "ng1" {
  depends_on   = [aws_launch_template.lt-ng1]
  cluster_name = aws_eks_cluster.cluster.name
  labels = {
    "eks/cluster-name"   = aws_eks_cluster.cluster.name
    "eks/nodegroup-name" = format("${var.environment}-ng1-%s", aws_eks_cluster.cluster.name)
  }
  node_group_name = format("${var.environment}-ng1-%s", aws_eks_cluster.cluster.name)
  node_role_arn   = aws_iam_role.eks-nodegroup-NodeInstanceRole.arn

  subnet_ids = var.subnet_ids #module.vpc.private_subnets
  tags = {
    "eks/cluster-name"                                                 = aws_eks_cluster.cluster.name
    "eks/nodegroup-name"                                               = format("${var.environment}-ng1-%s", aws_eks_cluster.cluster.name)
    "eks/nodegroup-type"                                               = "managed"
    "kubernetes.io/cluster-autoscaler/${aws_eks_cluster.cluster.name}" = "true"
    "kubernetes.io/cluster-autoscaler/enabled"                         = "true"
  }

  launch_template {
    name    = aws_launch_template.lt-ng1.name
    version = aws_launch_template.lt-ng1.latest_version
  }

  scaling_config {
    desired_size = var.worker["desired_size"]
    max_size     = var.worker["max_size"]
    min_size     = var.worker["min_size"]
  }

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size, launch_template]
  }

  timeouts {}
}
