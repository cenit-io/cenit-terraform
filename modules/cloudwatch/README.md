## Terraform module for AWS Cloudwatch

Terraform module which creates Cloudwatch dashboards and other resources. On the moment of creation of this module, it only creates the initial dashboards. On future releases, alarms and events will be created here as well.


## Basic usage example

```hcl
module "cloudwatch" {
  source        = "./cloudwatch"
  cluster_name  = "staging"
}             
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.48.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_dashboard.eks_cluster_metrics](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_dashboard) | resource |
| [aws_cloudwatch_dashboard.elb_metrics](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_dashboard) | resource |
| [aws_cloudwatch_dashboard.lambdas_metrics](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_dashboard) | resource |
| [aws_cloudwatch_dashboard.natgateway_metrics](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_dashboard) | resource |
| [aws_cloudwatch_dashboard.route53_metrics](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_dashboard) | resource |
| [aws_cloudwatch_dashboard.transitgateway_metrics](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_dashboard) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The eks cluster name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_cloudwatch_dashboard_eks_cluster_id"></a> [aws\_cloudwatch\_dashboard\_eks\_cluster\_id](#output\_aws\_cloudwatch\_dashboard\_eks\_cluster\_id) | n/a |
| <a name="output_aws_cloudwatch_dashboard_elb_metrics_id"></a> [aws\_cloudwatch\_dashboard\_elb\_metrics\_id](#output\_aws\_cloudwatch\_dashboard\_elb\_metrics\_id) | n/a |
| <a name="output_aws_cloudwatch_dashboard_lambdas_metrics_id"></a> [aws\_cloudwatch\_dashboard\_lambdas\_metrics\_id](#output\_aws\_cloudwatch\_dashboard\_lambdas\_metrics\_id) | n/a |
| <a name="output_aws_cloudwatch_dashboard_natgateway_metrics_id"></a> [aws\_cloudwatch\_dashboard\_natgateway\_metrics\_id](#output\_aws\_cloudwatch\_dashboard\_natgateway\_metrics\_id) | n/a |
| <a name="output_aws_cloudwatch_dashboard_route53_metrics_id"></a> [aws\_cloudwatch\_dashboard\_route53\_metrics\_id](#output\_aws\_cloudwatch\_dashboard\_route53\_metrics\_id) | n/a |
| <a name="output_aws_cloudwatch_dashboard_transitgateway_metrics_id"></a> [aws\_cloudwatch\_dashboard\_transitgateway\_metrics\_id](#output\_aws\_cloudwatch\_dashboard\_transitgateway\_metrics\_id) | n/a |

## Authors

Module created by Caylent 