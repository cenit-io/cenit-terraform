# Terraform module for AWS VPC

Terraform module which deploys an AWS VPC in a given AWS region.

The module creates one public and one private subnet per Availability Zone. The
AZs to deploy the subnets into as well as the CIDR ranges for each subnet has to
be passed as a module argument. It also supports the creation of database subnets,
which are private inside the VPC.

ACLs tables for public and private subnets are created with a set of rules enabled
by default:
- ALL Outbound traffic (any port, any destination) is allowed
- Any Inbound traffic is allowed if it was originated inside the VPC
- Return (Inbound) traffic to udp/tcp ephemeral ports (1024-65535) is also permitted.
This is for allowing the return traffic of communications originated from the VPC
to outside (like software updates).

The module supports we specify any custom Inbound rule we want to permit for ACLs
associated with public and private subnets.


## Basic usage example

```hcl
module "vpc" {
  source    = "./modules/vpc"

  # Network settings
  vpc_cidr              = "10.0.0.0/16"
  azs                   = ["us-east-1a", "us-east-1b"]
  public_subnets_cidrs  = ["10.0.0.0/23", "10.0.2.0/23"]
  private_subnets_cidrs = ["10.0.10.0/23", "10.0.12.0/23"]
  db_subnets_cidrs      = ["10.0.20.0/24", "10.0.21.0/24"]
  # Creates a NAT Gateway between private and public subnets
  enable_nat_gw         = true
  # Make only a single NAT Gateway for all AZs, rather than 1 for each AZ
  single_nat_gw         = true


  # Security settings: custom ACL rules for public subnets
  allow_inbound_traffic_public_subnet = [
    {
      protocol  = "tcp"
      from_port = 443
      to_port   = 443
      source    = "0.0.0.0/0"
    },
  ]

  # Tagging
  tags = {
    environment = "var.environment"
    App         = "App1"
  }

  # Tags needed for EKS to identify public and private subnets
  eks_network_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

  eks_private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }

}
```
## Inputs

| Name                                              | Description                                                                                                                                           |  Type  |       Default       | Required |
|---------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|:------:|:-------------------:|:--------:|
| allow\_external\_principals                       | Allow external principals to access the RAM Share for Transit Gateway?                                                                                | string |      `"false"`      |    no    |
| allow\_inbound\_traffic\_default\_private\_subnet | A list of maps of inbound traffic allowed by default for private subnets                                                                              |  list  |      `<list>`       |    no    |
| allow\_inbound\_traffic\_default\_public\_subnet  | A list of maps of inbound traffic allowed by default for public subnets                                                                               |  list  |      `<list>`       |    no    |
| allow\_inbound\_traffic\_private\_subnet          | The ingress traffic the customer needs to allow for private subnets                                                                                   |  list  |      `<list>`       |    no    |
| allow\_inbound\_traffic\_public\_subnet           | The inbound traffic the customer needs to allow for public subnets                                                                                    |  list  |      `<list>`       |    no    |
| auto\_accept\_shared\_attachments                 | Whether resource attachment requests are automatically accepted.                                                                                      | string |     `"disable"`     |    no    |
| azs                                               | A list of Availability Zones to use in a specific Region                                                                                              |  list  |         n/a         |   yes    |
| create\_transit\_gw                               | Create a transit gateway and related routing objects                                                                                                  | string |      `"false"`      |    no    |
| db\_subnet\_cidrs                                 | A list of the CIDR ranges for database subnets                                                                                                        |  list  |      `<list>`       |    no    |
| default\_route\_table\_association                | Whether resource attachments are automatically associated with the default association route table.                                                   | string |     `"enable"`      |    no    |
| default\_route\_table\_propagation                | Whether resource attachments automatically propagate routes to the default propagation route table.                                                   | string |     `"enable"`      |    no    |
| description                                       | Description of the transit gateway.                                                                                                                   | string | `"Transit Gateway"` |    no    |
| eks\_network\_tags                                | A map of tags needed by EKS to identify the VPC and subnets                                                                                           |  map   |       `<map>`       |    no    |
| eks\_private\_subnet\_tags                        | A map of tags needed by EKS to identify private subnets for internal LBs                                                                              |  map   |       `<map>`       |    no    |
| enable\_dns\_hostnames                            | True if DNS hostnames is enabled in the VPC                                                                                                           | string |      `"true"`       |    no    |
| enable\_dns\_support                              | True if the DNS support is enabled in the VPC                                                                                                         | string |      `"true"`       |    no    |
| enable\_igw                                       | True if you want an igw added to your public route table                                                                                              | string |      `"true"`       |    no    |
| enable\_nacls                                     | Enable creation of restricted-by-default network acls.                                                                                                | string |      `"true"`       |    no    |
| enable\_nat\_gw                                   | True if we want to create at least one NAT-gw for private subnets                                                                                     | string |      `"true"`       |    no    |
| environment                                       | Name of the environment                                        | string |        `""`         |    no    |
| icmp\_diagnostics\_enable                         | Enable full icmp for diagnostic purposes                                                                                                              | string |      `"false"`      |    no    |
| instance\_tenancy                                 | The type of tenancy for EC2 instances launched into the VPC                                                                                           | string |     `"default"`     |    no    |
| map\_to\_public\_ip                               | True if public IPs are assigned to instances launched in a subnet                                                                                     | string |      `"false"`      |    no    |
| private\_subnet\_cidrs                            | A list of the CIDR ranges to use for private subnets                                                                                                  |  list  |      `<list>`       |    no    |
| public\_subnet\_cidrs                             | A list of the CIDR ranges to use for public subnets                                                                                                   |  list  |      `<list>`       |    no    |
| region                                            | The AWS region we wish to provision in, by default                                                                                                    | string |    `"us-east-1"`    |    no    |
| remote\_transit\_gw                               | Is the transit gateway we are connecting to in a remote account?                                                                                      | string |      `"false"`      |    no    |
| share\_transit\_gw                                | Share this transit gateway via AWS Resource Access Manager (RAM)                                                                                      | string |      `"false"`      |    no    |
| single\_nat\_gw                                   | If true, all private and database subnets will share 1 Route Table and NAT GW.  If false, one NAT-gw per AZ will be created along with one RT per AZ. | string |      `"true"`       |    no    |
| tags                                              | A map of tags for the VPC resources                                                                                                                   |  map   |       `<map>`       |    no    |
| transit\_gw\_arn                                  | arn of the transit gateway to associate with                                                                                                          | string |        `""`         |    no    |
| transit\_gw\_association\_rt\_id                  | id of the transit gateway association route table                                                                                                     | string |        `""`         |    no    |
| transit\_gw\_cidr                                 | The CIDR range for the overall transit gateway network                                                                                                | string |        `""`         |    no    |
| transit\_gw\_id                                   | id of the transit gateway to associate with                                                                                                           | string |        `""`         |    no    |
| transit\_gw\_propagation\_rt\_id                  | id of the transit gateway propagation route table                                                                                                     | string |        `""`         |    no    |
| transit\_gw\_rt\_id                               | id of the transit gateway route table                                                                                                                 | string |        `""`         |    no    |
| transit\_gw\_share\_arn                           | The arn of the AWS RAM Share Arn for the existing Transit Gateway                                                                                     | string |        `""`         |    no    |
| use\_transit\_gw                                  | Use an existing transit gateway rather than creating standalone network objects.                                                                      | string |      `"false"`      |    no    |
| vpc\_cidr                                         | The CIDR range for the VPC                                                                                                                            | string |         n/a         |   yes    |
| vpn\_ecmp\_support                                | Whether VPN Equal Cost Multipath Protocol support is enabled.                                                                                         | string |     `"disable"`     |    no    |

## Outputs

| Name                             | Description                                                   |
|----------------------------------|---------------------------------------------------------------|
| azs                              | List of Availability Zones provisioned within                 |
| database\_subnets\_azs           | List of the AZ for the subnet                                 |
| db\_subnet\_cidrs                | List of database subnet cidr blocks provisioned               |
| db\_subnet\_ids                  | List of database subnet IDs provisioned                       |
| environment                      | Name of the environment we provisioned the VPC for            |
| igw\_id                          | Internet Gateway ID provisioned                               |
| nat\_gw\_ids                     | List of NAT Gateway IDs provisioned                           |
| private\_subnet\_cidrs           | List of private subnet cidr blocks provisioned                |
| private\_subnet\_ids             | List of private subnet IDs provisioned                        |
| public\_subnet\_cidrs            | List of public subnet cidr blocks provisioned                 |
| public\_subnet\_ids              | List of public subnet IDs provisioned                         |
| transit\_gw\_arn                 | ARN of the Transit Gateway provisioned                        |
| transit\_gw\_assocation\_rt\_id  | ID of the Transit Gateway Association Route Table             |
| transit\_gw\_id                  | ID of the Transit Gateway provisioned                         |
| transit\_gw\_owner\_id           | Owner ID of the Transit Gateway provisioned                   |
| transit\_gw\_propagation\_rt\_id | ID of the Transit Gateway Propagation Route Table             |
| transit\_gw\_rt\_id              | ID of the Transit Gateway Route Table provisioned             |
| transit\_gw\_share\_arn          | ARN of the Transit Gateway RAM Share                          |
| vpc\_cidr                        | CIDR of the overall environment config (covering all subnets) |
| vpc\_id                          | ID of the provisioned VPC                                     |





## Advanced Cross-Account Transit Gateway Implementation

The current state of this VPC module includes working Cross-Account Transit Gateway support, up to the current limitations of Terraform 0.11.  There is a working example within the examples folder implementing this, in the folder examples/vpc/multi-account-transitgw.  As of now, this will fail to run completely and will error-out with the below error messages:

```
* module.second_acct_complex_vpc_provision.aws_ec2_transit_gateway_vpc_attachment.remote: 1 error(s) occurred:
* module.second_acct_privonly_vpc_provision.aws_ec2_transit_gateway_vpc_attachment.remote: 1 error(s) occurred:
```
The reason for this is because there are two missing components in the current implementation of AWS Resource Access Manager resources, and we can temporarily get around this by doing one manual step and then re-running a plan/apply a second time, which will then complete successfully.  I cover this more in the comments for the module file transitgw_sharing.tf near the bottom, in the section for item 4).

To work with this today, you need to run a first plan/apply cycle, which will give you the errors mentioned above.  At that point, you now need to go to the second account (the account which you are trying to attach to the transit gateway, not the one where it was provisioned) and go to the Resource Access Manager section of the AWS Console.   In here, look under "Shared with me" and select the "shared-transitgw" invitiation and then click  "Accept resource share".  After this is accepted, run a second plan/apply cycle, which should finish the remaining items and complete the configuration.

This will not be required when the following# features are completed in Terraform and added to this VPC module:
 - Expose share invitation ARN via aws_ram_principal_association output:  https://github.com/terraform-providers/terraform-provider-aws/issues/9432
 - Implement new resource to accept the share RAM share invitation:   https://github.com/terraform-providers/terraform-provider-aws/issues/7601



