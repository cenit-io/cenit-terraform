### Kubernetes variables ###
variable "cluster_endpoint" {
  type = string
}

variable "cluster_ca_cert" {
  type = string
}

variable "cluster_autoscaler_version" {
  # more info at https://artifacthub.io/packages/helm/cluster-autoscaler/cluster-autoscaler
  description = "helm chart version of cluster autoscaler"
  type        = string
  default     = "9.9.2"
}

variable "metric_server_version" {
  # more info at https://artifacthub.io/packages/helm/bitnami/metrics-server
  # official manifest https://github.com/kubernetes-sigs/external-dns
  description = "helm chart version of metrics server"
  type        = string
  default     = "5.8.7"
}

variable "external_dns_version" {
  # more info https://artifacthub.io/packages/helm/bitnami/external-dns
  # official manifest https://github.com/kubernetes-sigs/metrics-server/releases
  description = "helm chart version of external dns"
  type        = string
  default     = "5.0.0"
}

variable "plugins_namespace" {
  description = "kubernetes namespace for plugins to be allocated, default namespace should be avoided, using kube-system"
  type        = string
  default     = "kube-system"
}

variable "autoscaler_sa_name" {
  description = "kubernetes service account name for cluster autoscaler, this value has to match the one used in the role definition"
  type        = string
  default     = "aws-cluster-autoscaler"
}

variable "external_dns_sa_name" {
  description = "kubernetes service account name for external-dns, this value has to match the one used in the role definition"
  type        = string
  default     = "external-dns"
}

variable "aws_lb_controller_sa_name" {
  description = "kubernetes service account name for aws-lb-controller plugin, this value has to match the one used in the role definition"
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "aws_lb_controller_version" {
  # home of the chart https://aws.github.io/eks-charts
  description = "aws-lb-controller helm chart version"
  type        = string
  default     = "1.2.0"
}

variable "cluster_name" {
  description = "cluster name, this is used for tags, and helm chart values"
  type        = string
  default     = "my-cluster"
}

variable "region" {
  description = "AWS region of the cluster"
  type        = string
  default     = "us-east-1"
}

variable "oidc_issuer" {
  description = "this is the oidc url used for the  used in IAM policies for trust relationships"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Used as a prefix, usually receives the terraform.workspace value"
  type        = string
  default     = "int"
}


variable "external_secrets_sa_name" {
  description = "kubernetes service account name for external secrets, this value has to match the one used in the role definition"
  type        = string
  default     = "external-secrets"
}


variable "external_secrets_version" {
  # more info at https://github.com/external-secrets/kubernetes-external-secrets
  description = "helm chart version of external_secrets"
  type        = string
  default     = "8.1.2"
}


variable "ebs_csi_version" {
  # more info at https://artifacthub.io/packages/helm/particuleio/aws-ebs-csi-driver/
  description = "helm chart version of aws-ebs-csi"
  type        = string
  default     = "0.9.4"
}

variable "ebs_containerResources_limits_cpu" {
  # more info at https://artifacthub.io/packages/helm/particuleio/aws-ebs-csi-driver/
  description = "ebs csi container limits"
  type        = string
  default     = "100m"
}

variable "ebs_containerResources_limits_memory" {
  # more info at https://artifacthub.io/packages/helm/particuleio/aws-ebs-csi-driver/
  description = "ebs csi container limits"
  type        = string
  default     = "100m"
}

variable "ebs_containerResources_requests_cpu" {
  # more info at https://artifacthub.io/packages/helm/particuleio/aws-ebs-csi-driver/
  description = "ebs csi container limits"
  type        = string
  default     = "100m"
}

variable "ebs_containerResources_requests_memory" {
  # more info at https://artifacthub.io/packages/helm/particuleio/aws-ebs-csi-driver/
  description = "ebs csi container limits"
  type        = string
  default     = "100m"
}

variable "ebs_csi_controller_sa_name" {
  # more info at https://artifacthub.io/packages/helm/particuleio/aws-ebs-csi-driver/
  type    = string
  default = "ebs-csi-controller-sa"
}

variable "ebs_csi_snapshot_sa_name" {
  # more info at https://artifacthub.io/packages/helm/particuleio/aws-ebs-csi-driver/
  type    = string
  default = "ebs-snapshot-controller"
}

variable "ebs_csi_node_sa_name" {
  # more info at https://artifacthub.io/packages/helm/particuleio/aws-ebs-csi-driver/
  type    = string
  default = "ebs-csi-node-sa"
}

variable "argocd_enable" {
  # more info at https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd
  default = false
}

variable "argocd_namespace" {
  # more info at https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd
  type    = string
  default = "argocd"
}

variable "argocd_version" {
  # more info at https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd
  type    = string
  default = "v2.0.4"
}

####### NEW RELIC VARIABLES ########
variable "new_relic_license_key" {
  type = string
}

####### CLOUDWATCH AGENT VARIABLES ########
variable "cloudwatch_namespace" {
  type    = string
  default = "amazon-cloudwatch"
}