variable "create_hosted_zone" {
  description = "Boolean that controls if whether to create a hosted zone or not"
  default     = true
}

variable "enable_cloudwatch_logs" {
  type        = bool
  description = "Enabler for cloudwatch logs."
  default     = false
}

variable "delegate_subdomain" {
  description = "If true, the subdomain will be delegated to the sub-account NS servers"
  default     = true
}

variable "domain_name" {
  description = "The parent domain name for whom we are creating a sub domain"
}

variable "parent_zone_id" {
  description = "The zone id of the parent hosted zone"
}

variable "subdomain_name" {
  description = "The subdomain name we are creating a hosted zone for"
}

variable "environment" {
  description = "The name of the environment we are creating this hosted zone for."
}

variable "tags" {
  description = "A map of tags for the Route53 resources"
  type        = map(any)
  default     = {}
}
