## argocd

resource "helm_release" "argo_cd" {
  count      = var.argocd_enable ? 1 : 0
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = var.argocd_namespace
  version    = var.argocd_version
  wait       = false

  set {
    type  = "string"
    name  = "server.service.type"
    value = "NodePort"
  }

  depends_on = [
    null_resource.wait_for_kubeconfig
  ]

}
 