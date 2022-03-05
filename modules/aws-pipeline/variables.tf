variable "project_name" {
  type        = string
  description = "The project name"
}

variable "enable_cloudwatch_logs" {
  type        = bool
  description = "Enabler for cloudwatch logs."
  default     = false
}

variable "repository_url" {
  type        = string
  description = "The full git repository url to source code from"
}

variable "source_branch" {
  type        = string
  description = "The default branch to source code from"
}

variable "build_compute_type" {
  type        = string
  description = "Code Build server size"
}

variable "repository_id" {
  type        = string
  description = "The path of the repository on Bitbucket."
}

variable "codebuild_env_variables" {
  description = "A list of maps containing the env variables to add to code build"
  type        = list(map)
}