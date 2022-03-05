# Terraform module for AWS MQ

## Basic usage example

```hcl
module "mq" {
  source        = "git@github.com:cenit-io/cenit-terraform.git//modules/mq"
  vpc_id        = var.vpc_id
  subnet_ids    = var.subnet_ids
  ssm_mq_user   = "/MQ/USER"
  ssm_mq_password = "/MQ/PASSWORD"
}            
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_mq_broker.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker) | resource |
| [aws_ssm_parameter.password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth_method"></a> [auth\_method](#input\_auth\_method) | n/a | `string` | `"simple"` | no |
| <a name="input_broker_name"></a> [broker\_name](#input\_broker\_name) | The name of the broker | `string` | `"test-broker"` | no |
| <a name="input_deployment_mode"></a> [deployment\_mode](#input\_deployment\_mode) | n/a | `string` | `"SINGLE_INSTANCE"` | no |
| <a name="input_engine_type"></a> [engine\_type](#input\_engine\_type) | The broker engine type | `string` | `"RabbitMQ"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The engine version of the Broker type | `string` | `"3.8.22"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type for the MQ broker | `string` | `"mq.t3.micro"` | no |
| <a name="input_ssm_mq_password"></a> [ssm\_mq\_password](#input\_ssm\_mq\_password) | The name of the ssm parameter for the password on MQ | `string` | `"/MQ/PASSWORD"` | no |
| <a name="input_ssm_mq_user"></a> [ssm\_mq\_user](#input\_ssm\_mq\_user) | The name of the ssm parameter for the user on MQ | `string` | `"/MQ/USER"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The subnet ids for the Broker. If using a SINGLE INSTANCE deployment mode, a single subnet id is expected. If using CLUSTER\_MULTI\_AZ, multiple subnet ids are expected. | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC id | `any` | n/a | yes |

## Outputs

No outputs.
