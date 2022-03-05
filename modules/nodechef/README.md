
# Terraform module for NodeChef Instances

Terraform module which creates the instances for Nodechef. After applying this module, you'll need to go to Nodechef and configure the service you desire passing the Elastic Ips of the instances.

## Basic usage example

```hcl
module "nodechef" {
  source        = "./nodechef"
  nodechef_cluster_count    = 3
  keypair_name              = "example"
  vpc_id                    = "vpc-123456789"
  vpc_cidr_block            = "10.1.0.0/16"
  instance_type             = "t3.large"
  subnet_ids                = [""]
}             
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.nodechef](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.nodechef_sec_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_subnet_ids.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | Disable the termination api on ec2 instances for more protection on termination. | `bool` | `false` | no |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | The ebs storage size in Gb. | `number` | `20` | no |
| <a name="input_ebs_volume_type"></a> [ebs\_volume\_type](#input\_ebs\_volume\_type) | The ebs volume type. | `string` | `"gp2"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type for the Ec2 instances. | `string` | n/a | yes |
| <a name="input_keypair_name"></a> [keypair\_name](#input\_keypair\_name) | Keypair name to access nodechef instances. | `string` | n/a | yes |
| <a name="input_nodechef_cluster_count"></a> [nodechef\_cluster\_count](#input\_nodechef\_cluster\_count) | Instance count for nodechef cluster. | `number` | `3` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The list of subnet ids that the instances will be placed on. | `list(string)` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | The VPC CIDR. | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The vpc id to place the instances. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nodechef_elastic_ips"></a> [nodechef\_elastic\_ips](#output\_nodechef\_elastic\_ips) | n/a |