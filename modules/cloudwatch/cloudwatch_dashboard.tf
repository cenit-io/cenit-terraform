resource "aws_cloudwatch_dashboard" "eks_cluster_metrics" {
  count          = var.env != "shared" && var.enable_eks_metrics ? 1 : 0
  dashboard_body = data.template_file.eks_cluster_metrics[0].rendered
  dashboard_name = "eks_cluster_metrics"
}

data "template_file" "eks_cluster_metrics" {
  count    = var.env != "shared" && var.enable_eks_metrics ? 1 : 0
  template = file("${path.module}/dashboards/eks_cluster_metrics.json.tpl")
  vars = {
    cluster_name = var.cluster_name
  }
}

resource "aws_cloudwatch_dashboard" "elb_metrics" {
  count          = var.env != "shared" && var.enable_elb_metrics ? 1 : 0
  dashboard_body = data.template_file.elb_metrics[0].rendered
  dashboard_name = "elb_metrics"
}

data "template_file" "elb_metrics" {
  count    = var.env != "shared" && var.enable_elb_metrics ? 1 : 0
  template = file("${path.module}/dashboards/elb_metrics.json.tpl")
  vars = {
    cluster_name = var.cluster_name
  }
}

resource "aws_cloudwatch_dashboard" "lambda_metrics" {
  count          = var.env != "shared" && var.enable_lambda_metrics ? 1 : 0
  dashboard_body = data.template_file.lambda_metrics[0].rendered
  dashboard_name = "lambda_metrics"
}

data "template_file" "lambda_metrics" {
  count    = var.env != "shared" && var.enable_lambda_metrics ? 1 : 0
  template = file("${path.module}/dashboards/lambda_metrics.json.tpl")
}

resource "aws_cloudwatch_dashboard" "natgateway_metrics" {
  count          = var.enable_natgateway_metrics ? 1 : 0
  dashboard_body = data.template_file.natgateway_metrics[0].rendered
  dashboard_name = "natgateway_metrics"
}

data "template_file" "natgateway_metrics" {
  count    = var.enable_natgateway_metrics ? 1 : 0
  template = file("${path.module}/dashboards/natgateway_metrics.json.tpl")
}

resource "aws_cloudwatch_dashboard" "route53_metrics" {
  count          = var.enable_route53_metrics ? 1 : 0
  dashboard_body = data.template_file.route53_metrics[0].rendered
  dashboard_name = "route53_metrics"
}

data "template_file" "route53_metrics" {
  count    = var.enable_route53_metrics ? 1 : 0
  template = file("${path.module}/dashboards/route53_metrics.json.tpl")
}


resource "aws_cloudwatch_dashboard" "transit_gateway_attachment_metrics" {
  count          = var.env != "shared" && var.enable_tg_attachment_metrics ? 1 : 0
  dashboard_body = data.template_file.transit_gateway_attachment_metrics[0].rendered
  dashboard_name = "tg_attachment_metrics"
}

data "template_file" "transit_gateway_attachment_metrics" {
  count    = var.env != "shared" && var.enable_tg_attachment_metrics ? 1 : 0
  template = file("${path.module}/dashboards/transit_gateway_attachment_metrics.json.tpl")
  vars = {
    tgw-attachment-id = data.aws_ec2_transit_gateway_vpc_attachment.this.id
    tgw-id            = data.aws_ec2_transit_gateway_vpc_attachment.this.transit_gateway_id
  }
}

data "aws_ec2_transit_gateway_vpc_attachment" "this" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

resource "aws_cloudwatch_dashboard" "amplify_metrics" {
  count          = var.env != "shared" && var.enable_amplify_metrics ? 1 : 0
  dashboard_body = data.template_file.amplify_metrics[0].rendered
  dashboard_name = "amplify_metrics"
}

data "template_file" "amplify_metrics" {
  count    = var.env != "shared" && var.enable_amplify_metrics ? 1 : 0
  template = file("${path.module}/dashboards/amplify_metrics.json.tpl")
  vars = {
    amplify_app_id = var.amplify_app_id
  }
}