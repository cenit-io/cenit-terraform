variable "env_vars" {
  type    = map(string)
  default = null
}

variable "app_name" {
  type = string
}

variable "buildspec" {
  default = null
}

variable "branch_env_var" {
  type    = map(string)
  default = null
}

variable "domain" {
  type    = string
  default = "staging.cenit.io"
}

variable "repository_url" {
  type = string
}

variable "domain_prefix" {
  type = string
}

variable "branch" {
  type = string
}

variable "framework" {
  default = "Web"
  type    = string
}
