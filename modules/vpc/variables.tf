# -------------------------------------------------------------
# Network variables
# -------------------------------------------------------------

variable "region" {
  description = "The AWS region we wish to provision in, by default"
  default     = "us-east-1"
}

variable "enable_cloudwatch_logs" {
  type        = bool
  description = "Enabler for cloudwatch logs."
  default     = false
}

variable "environment" {
  description = "Name of the environment"
  default     = ""
}

variable "vpc_cidr" {
  description = "The CIDR range for the VPC"
}

variable "transit_gw_cidr" {
  description = "The CIDR range for the overall transit gateway network"
  default     = ""
}

variable "enable_dns_support" {
  description = "True if the DNS support is enabled in the VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  description = "True if DNS hostnames is enabled in the VPC"
  default     = true
}

variable "instance_tenancy" {
  description = "The type of tenancy for EC2 instances launched into the VPC"
  default     = "default"
}

variable "map_to_public_ip" {
  description = "True if public IPs are assigned to instances launched in a subnet"
  default     = true
}

variable "azs" {
  description = "A list of Availability Zones to use in a specific Region"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "A list of the CIDR ranges to use for public subnets"
  type        = list(string)
  default     = []
}

variable "private_subnet_cidrs" {
  description = "A list of the CIDR ranges to use for private subnets"
  type        = list(string)
  default     = []
}

variable "db_subnet_cidrs" {
  description = "A list of the CIDR ranges for database subnets"
  type        = list(string)
  default     = []
}

variable "enable_nat_gw" {
  description = "True if we want to create at least one NAT-gw for private subnets"
  default     = true
}

variable "single_nat_gw" {
  description = "If true, all private and database subnets will share 1 Route Table and NAT GW.  If false, one NAT-gw per AZ will be created along with one RT per AZ."
  default     = true
}

variable "enable_igw" {
  description = "True if you want an igw added to your public route table"
  default     = true
}

variable "use_transit_gw" {
  description = "Use an existing transit gateway rather than creating standalone network objects."
  default     = false
}

variable "share_transit_gw" {
  description = "Share this transit gateway via AWS Resource Access Manager (RAM)"
  default     = false
}

variable "transit_gw_id" {
  description = "id of the transit gateway to associate with"
  default     = ""
}

variable "transit_gw_arn" {
  description = "arn of the transit gateway to associate with"
  default     = ""
}

variable "transit_gw_rt_id" {
  description = "id of the transit gateway route table"
  default     = ""
}

variable "transit_gw_share_arn" {
  description = "The arn of the AWS RAM Share Arn for the existing Transit Gateway"
  default     = ""
}

variable "transit_gw_association_rt_id" {
  description = "id of the transit gateway association route table"
  default     = ""
}

variable "transit_gw_propagation_rt_id" {
  description = "id of the transit gateway propagation route table"
  default     = ""
}

variable "create_transit_gw" {
  description = "Create a transit gateway and related routing objects"
  default     = false
}

variable "remote_transit_gw" {
  description = "Is the transit gateway we are connecting to in a remote account?"
  default     = false
}

variable "default_route_table_association" {
  description = "Whether resource attachments are automatically associated with the default association route table."
  default     = "enable"
}

variable "default_route_table_propagation" {
  description = "Whether resource attachments automatically propagate routes to the default propagation route table."
  default     = "enable"
}

variable "description" {
  description = "Description of the transit gateway."
  default     = "Transit Gateway"
}

variable "auto_accept_shared_attachments" {
  description = "Whether resource attachment requests are automatically accepted."
  default     = "disable"
}

variable "vpn_ecmp_support" {
  description = "Whether VPN Equal Cost Multipath Protocol support is enabled."
  default     = "disable"
}

variable "shared_with_root_org" {
  description = "True if this account should shared resources with the root organization "
}

variable "root_organization_arn" {
  description = "The AWS Organization root organization ARN"
}


# -------------------------------------------------------------
# Security variables
# -------------------------------------------------------------
variable "icmp_diagnostics_enable" {
  description = "Enable full icmp for diagnostic purposes"
  default     = false
}

variable "enable_nacls" {
  description = "Enable creation of restricted-by-default network acls."
  default     = true
}

variable "allow_inbound_traffic_default_public_subnet" {
  description = "A list of maps of inbound traffic allowed by default for public subnets"
  type = list(object({
    protocol  = string
    from_port = number
    to_port   = number
    source    = string
  }))

  default = [
    {
      # ephemeral tcp ports (allow return traffic for software updates to work)
      protocol  = "tcp"
      from_port = 1024
      to_port   = 65535
      source    = "0.0.0.0/0"
    },
    {
      # ephemeral udp ports (allow return traffic for software updates to work)
      protocol  = "udp"
      from_port = 1024
      to_port   = 65535
      source    = "0.0.0.0/0"
    },
  ]
}

variable "allow_inbound_traffic_public_subnet" {
  description = "The inbound traffic the customer needs to allow for public subnets"
  type = list(object({
    protocol  = string
    from_port = number
    to_port   = number
    source    = string
  }))
  default = []
}

variable "allow_inbound_traffic_default_private_subnet" {
  description = "A list of maps of inbound traffic allowed by default for private subnets"
  type = list(object({
    protocol  = string
    from_port = number
    to_port   = number
    source    = string
  }))

  default = [
    {
      # ephemeral tcp ports (allow return traffic for software updates to work)
      protocol  = "tcp"
      from_port = 1024
      to_port   = 65535
      source    = "0.0.0.0/0"
    },
    {
      # ephemeral udp ports (allow return traffic for software updates to work)
      protocol  = "udp"
      from_port = 1024
      to_port   = 65535
      source    = "0.0.0.0/0"
    },
  ]
}

variable "allow_inbound_traffic_private_subnet" {
  description = "The ingress traffic the customer needs to allow for private subnets"
  type = list(object({
    protocol  = string
    from_port = number
    to_port   = number
    source    = string
  }))
  default = []
}

variable "allow_external_principals" {
  description = "Allow external principals to access the RAM Share for Transit Gateway?"
  default     = false
}

# -------------------------------------------------------------
# Tagging
# -------------------------------------------------------------

variable "tags" {
  description = "A map of tags for the VPC resources"
  type        = map(string)
  default     = {}
}

variable "eks_network_tags" {
  description = "A map of tags needed by EKS to identify the VPC and subnets"
  type        = map(string)
  default     = {}
}

variable "eks_private_subnet_tags" {
  description = "A map of tags needed by EKS to identify private subnets for internal LBs"
  type        = map(string)
  default     = {}
}

variable "eks_public_subnet_tags" {
  description = "A map of tags needed by EKS to identify public subnets for public LBs"
  type        = map(string)
  default     = {}
}
