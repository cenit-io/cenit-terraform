resource "aws_codestarconnections_connection" "this" {
  name          = "${var.project_name}-connection"
  provider_type = "Bitbucket"
}