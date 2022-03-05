# --------------------------------------------------------------------
# Aws org variables
# --------------------------------------------------------------------

variable "create_organization" {
  description = "True if we want to create an organization. False if it already exists"
  type        = bool
  default     = "false"
}

variable "feature" {
  description = "The features we want to enable for the organization [ALL|CONSOLIDATED_BILLING]"
  default     = "ALL"
}

variable "service_access_principals" {
  description = "List of AWS service principal names for which you want to enable integration with your organization. This is typically in the form of a URL, such as service-abbreviation.amazonaws.com. Organization must have feature_set set to ALL. For additional information, see: https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html"
  type        = list(string)
  default     = []
}

variable "policy_types" {
  description = "List of Organizations policy types to enable in the Organization Root. Organization must have feature_set set to ALL"
  type        = list(string)
  default     = []
}


