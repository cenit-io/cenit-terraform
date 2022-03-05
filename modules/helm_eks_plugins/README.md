### Helm install of eks plugins

#### Requirements

- Main infrastructure has to be already deployed
- Connection to VPN is required for this to work since the EKS cluster endpoint is private

##### Suported Plugins

- Cluster Autoscaler
- External DNS
- Metric Server [for horizontal pod autoscaling hpa]

#### Usage

See the variables.tf file for a description of the values required, this will use the community terraform module for IAM role with oidc support

The module will install all plugins in the kube-system namespace by default, you can customize this value but the namespace have to exist already

```
module "eks_plugins" {
  source = "../terraform-modules.git//helm_eks_plugins"

  plugins_namespace          = "kube-system"
  autoscaler_sa_name         = "aws-cluster-autoscaler"
  external_dns_sa_name       = "external-dns"
  cluster_autoscaler_version = "9.9.2"
  external_dns_version       = "5.0.0"
  metric_server_version      = "5.8.7"
  oidc_issuer                = "https://oidc.eks.us-east-1.amazonaws.com/id/XXXXXXX"
  environment                = "integration"
}
```
