### Using helm provider we install the following helm chart to apply the metric-server plugin into the eks cluster
### We set the variables required for this to work properly, you can find more details at the chart definition
### https://artifacthub.io/packages/helm/bitnami/metrics-server

resource "helm_release" "metric_server" {
  name            = "metric-server"
  repository      = "https://charts.bitnami.com/bitnami"
  chart           = "metrics-server"
  namespace       = var.plugins_namespace
  version         = var.metric_server_version
  cleanup_on_fail = true

  # this value comes false as default, but it is required to work properly on aws clouds
  set {
    name  = "apiService.create"
    value = true
  }
  set {
    name  = "podLabels.app"
    value = "kube-state-metrics"
  }

  depends_on = [
    null_resource.wait_for_kubeconfig
  ]
}

### No IAM resources are required for this plugin to work properly
