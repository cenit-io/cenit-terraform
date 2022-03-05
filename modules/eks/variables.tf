variable "cluster_name" {
  description = "EKS Cluster Name"
  default     = "application"
  type        = string
}

variable "generate_kube_config" {
  description = "Whether to generate a kubeconfig file or not"
  type        = bool
  default     = true
}

variable "enable_cloudwatch_logs" {
  type        = bool
  description = "Enabler for cloudwatch logs."
  default     = false
}

variable "administration_cidrs" {
  description = "CIDR from Network account to manage eks cluster"
  default     = ["10.100.0.0/16"]
  type        = list(string)
}


variable "cluster_log_types" {
  description = "List of the cluster logs we want to enable"
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler", ]
  type        = list(string)
}

variable "endpoint_private_access" {
  description = "Configure eks api endpoint to be private"
  default     = true
  type        = bool
}

variable "endpoint_public_access" {
  description = "Configure eks api endpoint to be private"
  default     = true
  type        = bool
}

variable "subnet_ids" {
  description = "Subnets ids to place workers"
  default     = [""]
  type        = list(string)
}

variable "cluster_version" {
  description = "EKS control plane version"
  default     = "1.19"
  type        = string
}

variable "environment" {
  description = "Environment prefix"
  default     = "default"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type for worker nodes"
  default     = "m5.large"
  type        = string
}

variable "key_name" {
  description = "EC2 keypair for worker nodes"
  default     = ""
  type        = string
}

variable "vpc_id" {
  description = "VPC id where nodes will be placed"
  default     = ""
  type        = string
}

variable "cidr_block" {
  description = "VPC cidr block"
  default     = ""
  type        = string
}

variable "tags" {
  default = {}
  type    = map(any)
}

variable "worker_node_policies" {
  type = list(string)

  default = [
    "AmazonEKSWorkerNodePolicy",
    "AmazonEKS_CNI_Policy",
    "AmazonEC2ContainerRegistryReadOnly",
    "CloudWatchAgentServerPolicy",
    "AmazonSSMManagedInstanceCore",
    "CloudWatchFullAccess"
  ]
}

variable "ecr_repositories" {
  type = list(string)
  default = [
    "arn:aws:ecr:us-east-1:035696680276:repository/cenit-base",
    "arn:aws:ecr:us-east-1:035696680276:repository/cenit-backend-with-base-image",
    "arn:aws:ecr:us-east-1:035696680276:repository/cenit-frontend-with-base-image",
    "arn:aws:ecr:us-east-1:035696680276:repository/nr-infrastructure",
    "arn:aws:ecr:us-east-1:035696680276:repository/centos-base"
  ]
}

variable "autoscaler_version" {
  default = "v1.20.0"
}

variable "ebs_kms" {
  default = ""
}

variable "worker" {
  type        = map(string)
  description = "Map of EKS workers settings"

  default = {
    instance_type         = "m5.large"
    desired_size          = "2"
    min_size              = "1"
    max_size              = "4"
    key_name              = ""
    volume_size           = "30"
    encrypted             = true
    volume_type           = "gp2"
    delete_on_termination = true
  }
}

variable "map_users" {
  description = "A list of maps with the IAM users allowed to access EKS"
  type = list(object({
    user_arn = string
    username = string
    group    = string
  }))
  default = []
  # example:
  #
  #  map_users = [
  #    {
  #      user_arn = "arn:aws:iam::<aws-account>:user/JohnSmith"
  #      username = "john"
  #      group    = "system:masters" # cluster-admin
  #    },
  #    {
  #      user_arn = "arn:aws:iam::<aws-account>:user/PeterMiller"
  #      username = "peter"
  #      group    = "ReadOnlyGroup"  # custom role granting read-only permissions
  #    }
  #  ]
  #
}

variable "map_roles" {
  description = "A list of maps with the roles allowed to access EKS"
  type = list(object({
    role_arn = string
    username = string
    group    = string
  }))
  default = []
  # example:
  #
  #  map_roles = [
  #    {
  #      role_arn = "arn:aws:iam::<aws-account>:role/ReadOnly"
  #      username = "john"
  #      group    = "system:masters" # cluster-admin
  #    },
  #    {
  #      role_arn = "arn:aws:iam::<aws-account>:role/Admin"
  #      username = "peter"
  #      group    = "ReadOnlyGroup"  # custom role granting read-only permissions
  #    }
  #  ]
  #
}
