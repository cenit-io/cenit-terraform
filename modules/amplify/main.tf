resource "aws_amplify_app" "this" {
  depends_on = [
    data.local_file.token
  ]
  name       = var.app_name
  repository = var.repository_url

  oauth_token = data.local_file.token.content

  # The default build_spec added by the Amplify Console for React.
  build_spec = var.buildspec != null ? var.buildspec : <<-EOT
version: 1
frontend:
  phases:
    preBuild:
      commands:
        - npm install
        - npm rebuild node-sass
    build:
      commands:
        - npm run build
  artifacts:
    baseDirectory: /build
    files:
      - '**/*'
  cache:
    paths:
      - node_modules/**/*
  EOT

  # The default rewrites and redirects added by the Amplify Console.
  custom_rule {
    source    = "/<*>"
    status    = "404"
    target    = "/index.html"
    condition = "rewrite"
  }

  environment_variables = var.env_vars
}

resource "aws_amplify_branch" "this" {
  app_id      = aws_amplify_app.this.id
  branch_name = var.branch

  framework = var.framework

  environment_variables = var.branch_env_var
}

resource "aws_amplify_domain_association" "this" {
  app_id      = aws_amplify_app.this.id
  domain_name = var.domain

  sub_domain {
    branch_name = aws_amplify_branch.this.branch_name
    prefix      = var.domain_prefix
  }
}

data "aws_ssm_parameter" "oauth_token" {
  name = "/bitbucket/oauth_token"
}

output "oauth_token" {
  value = data.aws_ssm_parameter.oauth_token.value
}

resource "null_resource" "access_token" {
  depends_on = [
    data.aws_ssm_parameter.oauth_token
  ]
  provisioner "local-exec" {
    command     = "curl -X POST -u ${data.aws_ssm_parameter.oauth_token.value} https://bitbucket.org/site/oauth2/access_token -d grant_type=client_credentials > token.json && echo $(cat token.json | jq '.access_token') > token.json"
    interpreter = ["/bin/bash", "-c"]
  }

  triggers = {
    always_run = timestamp()
  }
}

data "local_file" "token" {
  filename = "./token.json"
  depends_on = [
    null_resource.access_token
  ]
}