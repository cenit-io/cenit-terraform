## Terraform module for AWS Organizations

Terraform module which creates and manages organizations.


* Sets up AWS Organizations in a target account 

* Configure AWS Orgs for either "ALL" or Consolidated Billing only feature sets

## Basic usage example

```hcl
module "org" {
  
  source    = "./aws_org/organization"
  create_organization = "true"                                                                 
}             
  

```
## Inputs                                                                                       
                                                                                                
| Name | Description | Type | Default | Required |                                              
|------|-------------|------|---------|----------|                                                   
| create\_organization | Bool to toggle organization creation | string | `"true"` | yes |                
| feature\_set | Specify "ALL"  or "CONSOLIDATED_BILLING" | string | `"ALL"` | optional │
| aws\_service\_access\_principals | Specify the list of  services principals in the form of URL | string | `""` | optional │
| enabled\_policy\_types |  List of Organizations policy types to enable in the Organization Root | string | `""` | optional │
                                                                              

## Outputs

| Name | Description |
|------|-------------|
| organization\_arn | The ARN of the org |
| organization\_id | The Id of the org |
| master\_account\_arn | The ARN of the master account |
| master\_account\_email | The master account email |

## Authors

Module created by Caylent 


