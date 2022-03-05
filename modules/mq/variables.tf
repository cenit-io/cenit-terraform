variable "vpc_id" {
  description = "The VPC id"
}

# variables
variable "broker_name" {
  default     = "cenit-broker"
  description = "The name of the broker"
}

variable "deployment_mode" {
  default = "SINGLE_INSTANCE"
}

variable "auth_method" {
  default = "simple"
}

variable "subnet_ids" {
  description = "The subnet ids for the Broker. If using a SINGLE INSTANCE deployment mode, a single subnet id is expected. If using CLUSTER_MULTI_AZ, multiple subnet ids are expected."
}

variable "instance_type" {
  default     = "mq.t3.micro"
  description = "The instance type for the MQ broker"
}

variable "engine_version" {
  default     = "3.8.22"
  description = "The engine version of the Broker type"
}

variable "engine_type" {
  default     = "RabbitMQ"
  description = "The broker engine type"
}
