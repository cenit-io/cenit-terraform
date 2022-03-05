data "aws_eks_cluster" "masters" {
  name = aws_eks_cluster.cluster.id
}

data "aws_eks_cluster_auth" "masters_auth" {
  name = aws_eks_cluster.cluster.id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.masters.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.masters.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.masters.id]
    command     = "aws"
  }
}