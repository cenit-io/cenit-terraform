## Terraform module for AWS Code Pipeline

Terraform module which creates CodePipeline pipeline, with S3 bucket for Artifact Store, CodeBuild for build, codestar connection to bitbucket for source code and iam policies and roles for code build and code pipeline.


## Basic usage example

```hcl
module "aws-pipeline" {
  source                = "./aws-pipeline"
  project_name          = "test-project"
  repository_id         = "cenit-io/cenit"
  repository_url        = "https://USER@github.com/cenit-io/cenit.git"
  source_branch         = "main"
  build_compute_type    = "BUILD_GENERAL1_SMALL"
  codebuild_env_variables         = [
  {
    "name": "AWS_DEFAULT_REGION",
    "type": "PLAINTEXT",
    "value": "us-east-1"
  },
  {
    "name": "AWS_ACCOUNT_ID",
    "type": "PLAINTEXT",
    "value": "035696680276"
  },
  {
    "name": "IMAGE_REPO_NAME",
    "type": "PLAINTEXT",
    "value": "justtest"
  }
]
}             
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_codebuild_project.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |
| [aws_codepipeline.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_codestarconnections_connection.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codestarconnections_connection) | resource |
| [aws_iam_policy.codebuild_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.codepipeline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.codebuild_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.codepipeline_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.codebuild_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.codepipeline_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.codepipeline_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_iam_policy_document.codebuild_assumerole_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.codebuild_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.codepipeline_assumerole_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.codepipeline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_build_compute_type"></a> [build\_compute\_type](#input\_build\_compute\_type) | Code Build server size | `string` | n/a | yes |
| <a name="input_codebuild_env_variables"></a> [codebuild\_env\_variables](#input\_env\_variables) | A list of maps containing the env variables to add to code build | `list(map)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project name | `string` | n/a | yes |
| <a name="input_repository_id"></a> [repository\_id](#input\_repository\_id) | The path of the repository on Bitbucket. | `string` | n/a | yes |
| <a name="input_repository_url"></a> [repository\_url](#input\_repository\_url) | The full git repository url to source code from | `string` | n/a | yes |
| <a name="input_source_branch"></a> [source\_branch](#input\_source\_branch) | The default branch to source code from | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_codebuild_project_id"></a> [aws\_codebuild\_project\_id](#output\_aws\_codebuild\_project\_id) | n/a |
| <a name="output_aws_codepipeline_id"></a> [aws\_codepipeline\_id](#output\_aws\_codepipeline\_id) | n/a |

## Authors

Module created by Caylent 
