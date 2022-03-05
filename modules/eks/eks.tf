# --------------------------------------------------------------------
# kubeconfig file
# --------------------------------------------------------------------

## generate a template for the kubeconfig file
data "template_file" "kubeconfig" {
  template = file("${path.module}/templates/kubeconfig.yaml.tpl")

  vars = {
    cluster_name     = aws_eks_cluster.cluster.name
    cluster_endpoint = aws_eks_cluster.cluster.endpoint
    cluster_cert     = aws_eks_cluster.cluster.certificate_authority[0].data
  }
}

## generate a local file from the rendered template, to be used by TF to deploy kube objects
resource "local_file" "kubeconfig" {
  count = var.generate_kube_config ? 1 : 0

  content  = data.template_file.kubeconfig.rendered
  filename = "./.kube/config"
}

resource "aws_eks_cluster" "cluster" {
  enabled_cluster_log_types = var.cluster_log_types
  name                      = var.cluster_name

  role_arn = aws_iam_role.eks-cluster-ServiceRole.arn
  tags = merge(
    local.default_tags,
    var.tags,
  )
  version = var.cluster_version

  timeouts {}

  vpc_config {
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    security_group_ids      = [aws_security_group.cluster-sg.id]
    subnet_ids              = var.subnet_ids
  }
}

## generate base template for workers
data "template_file" "worker_role_arns" {
  template = file("${path.module}/templates/worker-role.tpl")

  vars = {
    workers_role_arn = aws_iam_role.eks-nodegroup-NodeInstanceRole.arn
  }
}

## generate templates mapping IAM users with cluster entities (users/groups)
data "template_file" "map_users" {
  count    = length(var.map_users)
  template = file("${path.module}/templates/aws-auth_map-users.yaml.tpl")

  vars = {
    user_arn = var.map_users[count.index]["user_arn"]
    username = var.map_users[count.index]["username"]
    group    = var.map_users[count.index]["group"]
  }
}

## generate templates mapping IAM roles with cluster entities (users/groups)
data "template_file" "map_roles" {
  count    = length(var.map_roles)
  template = file("${path.module}/templates/aws-auth_map-roles.yaml.tpl")

  vars = {
    role_arn = var.map_roles[count.index]["role_arn"]
    username = var.map_roles[count.index]["username"]
    group    = var.map_roles[count.index]["group"]
  }
}

## deploy the aws-auth ConfigMap
resource "kubernetes_config_map" "aws_auth_cm" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = join(
      "",
      data.template_file.map_roles.*.rendered,
      data.template_file.worker_role_arns.*.rendered,
    )
    mapUsers = join("", data.template_file.map_users.*.rendered)
  }

  depends_on = [
    aws_eks_cluster.cluster,
    aws_eks_node_group.ng1,
  ]
}