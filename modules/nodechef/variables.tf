variable "nodechef_cluster_count" {
  type        = number
  description = "Instance count for nodechef cluster."
  default     = 3
}

variable "keypair_name" {
  type        = string
  description = "Keypair name to access nodechef instances."
}

variable "vpc_id" {
  type        = string
  description = "The vpc id to place the instances."
}

variable "vpc_cidr_block" {
  type        = string
  description = "The VPC CIDR."
}

variable "ebs_volume_size" {
  type        = number
  description = "The ebs storage size in Gb."
  default     = 20
}

variable "ebs_volume_type" {
  type        = string
  description = "The ebs volume type."
  default     = "gp2"
}

variable "instance_type" {
  type        = string
  description = "The instance type for the Ec2 instances."
}

variable "disable_api_termination" {
  type        = bool
  description = "Disable the termination api on ec2 instances for more protection on termination."
  default     = false
}

variable "subnet_ids" {
  type        = list(string)
  description = "The list of subnet ids that the instances will be placed on."
}

variable "nat_gateway_ips" {
  description = "The list of public ips for Nat Gateways"
}