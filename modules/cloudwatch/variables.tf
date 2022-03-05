variable "cluster_name" {
  type        = string
  description = "The eks cluster name."
}

variable "env" {
  type        = string
  description = "The current environment."
}

variable "vpc_id" {
  type        = string
  description = "The VPC id to retrieve the transit gateway attachment."
}

variable "amplify_app_id" {
  type        = string
  description = "The amplify app id for dashboards monitoring."
}

## ENABLERS

variable "enable_amplify_metrics" {
  default = false
  type    = bool
}

variable "enable_tg_attachment_metrics" {
  default = false
  type    = bool
}

variable "enable_route53_metrics" {
  default = false
  type    = bool
}

variable "enable_lambda_metrics" {
  default = false
  type    = bool
}

variable "enable_elb_metrics" {
  default = false
  type    = bool
}

variable "enable_eks_metrics" {
  default = false
  type    = bool
}

variable "enable_natgateway_metrics" {
  default = false
  type    = bool
}