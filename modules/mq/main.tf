# Broker
resource "aws_mq_broker" "this" {
  broker_name = var.broker_name

  auto_minor_version_upgrade = true
  deployment_mode            = var.deployment_mode
  publicly_accessible        = true

  engine_type             = var.engine_type
  engine_version          = var.engine_version
  host_instance_type      = var.instance_type
  authentication_strategy = var.auth_method

  subnet_ids = [var.subnet_ids]

  logs {
    general = false
    audit   = false
  }

  user {
    username = "cenit_backend"
    password = random_password.password.result
  }
}

# user and password
resource "random_password" "password" {
  length  = 16
  special = false
}

resource "aws_ssm_parameter" "mq_user_secret" {
  name        = upper("/BACKEND/RABBITMQ_DEFAULT_USER")
  description = "mq user secret"
  overwrite   = true
  type        = "String"
  value       = "cenit_backend"
}

resource "aws_ssm_parameter" "mq_pass_secret" {
  name        = upper("/BACKEND/RABBITMQ_DEFAULT_PASS")
  description = "mq pass secret"
  overwrite   = true
  type        = "SecureString"
  value       = random_password.password.result
}

resource "aws_ssm_parameter" "mq_url_secret" {
  name        = upper("/BACKEND/RABBITMQ_BIGWIG_TX_URL")
  description = "mq url secret"
  overwrite   = true
  type        = "SecureString"
  value       = "amqps://cenit_backend:${random_password.password.result}@${substr(aws_mq_broker.this.instances.0.endpoints.0, 8, -1)}/vhost_cenit"
}
