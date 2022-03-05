## Terraform module for AWS Organizations Unit

Terraform module which creates organizational unit.



## Basic usage example

```hcl
module "organizational_unit" {
  
  source    = "./aws_org/ou"
  name      = "examplecenitou"
  parent_id = "ou-xxxx-xxxxxxxx"

}             
  

```
## Inputs                                                                                       
                                                                                                
| Name | Description | Type | Default | Required |                                              
|------|-------------|------|---------|----------|                                                   
| name | The name for the organizational unit | string | `""` | yes |                
| parent\_id | ID of the parent organizational unit, which may be the root | string | `""` | yes │
                                                                              

## Outputs

| Name | Description |
|------|-------------|
| organizations\_organizational\_unit\_arn | ARN of the organizational unit |
| organizations\_organizational\_unit\_id |  Identifier of the organization unit |

## Authors

Module created by Caylent 


