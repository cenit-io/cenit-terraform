## Terraform module for AWS Organizations Accounts

Terraform module which provides a resource to create a member account in the current organization.


* Sets up AWS Account member in a organization or organization unit. 


## Basic usage example

```hcl
module "organization_account" {
  
  source    = "./aws_org/aws_account"
  member_account       = "true"
  name_account_config  = "secondary_account"
  email_account_config = "username@cenit.io"
}
  
  # Tagging
  tags = {
    environment = "${terraform.workspace}"
  }
}
```
## Inputs                                                                                       
                                                                                                
| Name | Description | Type | Default | Required |                                              
|------|-------------|------|---------|----------|                                                   
| member\_account | Bool to toggle organization member account creation | string | `"true"` | yes |                
| name | A friendly name for the member account | string | `""` | yes │
| email | The email address of the owner to assign to the new member account. This email address must not already be associated with another AWS account  | string | `""` | yes │
| role\_name | The name of an IAM role that Organizations automatically preconfigures in the new member account | string | `""` | optional │
| parent\_id | Parent Organizational Unit ID or Root ID for the account, if it is not defined take ROOT ID as default | string | `""` | optional │
| iam\_user\_access\_to\_billing | If set to ALLOW, the new account enables IAM users to access account billing information if they have the required permissions | string | `"ALLOW"` | optional │                                                                              

## Outputs

| Name | Description |
|------|-------------|
| account\_arn | The ARN of the aws  account member |
| account\_id | The Id of the aws account member |

## Authors

Module created by Caylent 


