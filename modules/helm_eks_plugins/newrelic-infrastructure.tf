### Using helm provider we install the following helm chart to apply the newrelic infrastructure into the eks cluster
### We set the variables required for this to work properly, you can find more details at the chart definition
### https://github.com/newrelic/helm-charts/tree/master/charts/

resource "helm_release" "nri-bundle" {
  name            = "nri-bundle"
  repository      = "https://helm-charts.newrelic.com"
  chart           = "nri-bundle"
  namespace       = var.plugins_namespace
  cleanup_on_fail = true

  # this value comes false as default, but it is required to work properly on aws clouds
  set {
    name  = "global.licenseKey"
    value = var.new_relic_license_key
  }
  set {
    name  = "global.cluster"
    value = var.cluster_name
  }
  set {
    name  = "infrastructure.enabled"
    value = true
  }
  set {
    name  = "prometheus.enabled"
    value = true
  }
  set {
    name  = "webhook.enabled"
    value = true
  }
  set {
    name  = "ksm.enabled"
    value = false
  }
  set {
    name  = "kubeEvents.enabled"
    value = true
  }
  set {
    name  = "logging.enabled"
    value = true
  }
  set {
    name  = "newrelic-infrastructure.kubeStateMetricsUrl"
    value = "http://metric-server-metrics-server"
  }

  depends_on = [
    null_resource.wait_for_kubeconfig
  ]
}

### No IAM resources are required for this plugin to work properly