### Using helm provider we install the following helm chart to apply the metric-server plugin into the eks cluster
### We set the variables required for this to work properly, you can find more details at the chart definition
### https://artifacthub.io/packages/helm/bitnami/metrics-server

resource "helm_release" "aws-cloudwatch-metrics" {
  name             = "aws-cloudwatch-metrics"
  repository       = "https://aws.github.io/eks-charts"
  chart            = "aws-cloudwatch-metrics"
  namespace        = var.cloudwatch_namespace
  cleanup_on_fail  = true
  create_namespace = true

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  depends_on = [
    null_resource.wait_for_kubeconfig
  ]
}