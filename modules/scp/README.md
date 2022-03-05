## Terraform module for AWS Organizations policy




* Provides a resource to manage an AWS Organizations policy, it also provides a resource to attach an AWS Organizations policy to an organization account, root, or unit. 


## Basic usage example

```hcl

module "organizations_policy" {
  source    = "./aws_org/scp"
  name         = "example"
  target_id    = local.target_id
  effects      = "Allow" 
  actions = ["cloudtrail:StopLogging"]

  description = "Example policy"
  type        = "SERVICE_CONTROL_POLICY"
  enabled     = "true"
}

locals {
  target_id         = var.target_id != "" ? var.target_id : local.default_target_id
  default_target_id = ""
}
                                           
  
```
## Inputs                                                                                       
                                                                                                
| Name | Description | Type | Default | Required |                                              
|------|-------------|------|---------|----------|                                                   
| name | The friendly name to assign to the policy | string | `""` | yes |
| effects | The values allowed for the SCP Policy (Allow or Deny) in the case that the value is (Allow) the SCP (FullAWSAccess) policy should be detached from root or OU | string | `""` | yes |
| actions | The services actions allowed or denied| list(string) | `""` | yes | 
| content | The policy content to add to the new policy | string | `""` | yes |                
| description | A description to assign to the policy | string | `""` | optional │
| type | The type of policy to create, Currently, the only valid value is SERVICE\_CONTROL\_POLICY | string | `"SERVICE_CONTROL_POLICY"` | optional │
| policy\_id |  The unique identifier (ID) of the policy that you want to attach to the target | string | `""` | yes |
| target\_id | The unique identifier (ID) of the root, organizational unit, or account number that you want to attach the policy to. | string | `""` | yes |                                                                              

## Outputs

| Name | Description |
|------|-------------|
| organizations\_policy\_arn | Amazon Resource Name (ARN) of the policy |
| organizations\_policy\_id | The unique identifier (ID) of the policy |

## Authors

Module created by Caylent 


