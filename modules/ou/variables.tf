# --------------------------------------------------------------------
# Aws Organization Unit  variables
# --------------------------------------------------------------------

variable "name" {
  description = "The name for the organizational unit"
  type        = string
  default     = ""
}


variable "parent_id" {
  description = "ID of the parent organizational unit, which may be the root"
  type        = string
  default     = ""
}
