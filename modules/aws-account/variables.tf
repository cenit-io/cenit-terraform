# --------------------------------------------------------------------
# Aws org account variables
# --------------------------------------------------------------------


variable "member_account" {
  description = "True if we want to create an AWS account. False if not."
  type        = bool

}

variable "name_account_config" {
  description = "A map with the configuration (name) needed to create the account"
  type        = string
}

variable "email_account_config" {
  description = "A map with the configuration (email) needed to create the account"
  type        = string
}


variable "admin_role_name" {
  description = "The name of the preconfigured role in new member accounts"
  type        = string
  default     = "OrganizationAccountAccessRole"
}

variable "enable_billing_access" {
  description = "If new accounts enables users to access account billing info [ALLOW|DENY]"
  type        = string
  default     = "ALLOW"
}

variable "parent_id" {
  description = "Parent Organizational Unit ID or Root ID for the account"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags for the Organization Account"
  type        = map(string)
  default     = {}
}

