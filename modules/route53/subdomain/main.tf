# -------------------------------------------------------------------------------------------------------
# AWS Route53 resources
# -------------------------------------------------------------------------------------------------------

## Route53 hosted zone for a sub-domain
resource "aws_route53_zone" "subdomain" {
  count    = var.create_hosted_zone ? 1 : 0
  provider = aws.subdomain
  name     = "${var.subdomain_name}.${var.domain_name}"

  tags = {
    "Name" = "${var.subdomain_name}.${var.domain_name}-hosted-zone"
  }

  force_destroy = false
}

## Route53 app health check
resource "aws_route53_health_check" "this" {
  count             = var.enable_cloudwatch_logs ? 1 : 0
  fqdn              = "app.${var.subdomain_name}.${var.domain_name}"
  port              = 443
  type              = "HTTPS"
  resource_path     = "/"
  failure_threshold = "5"
  request_interval  = "30"

  tags = {
    Name = "${var.subdomain_name}"
  }
}


### The block below is commented for now. After we complete the Domain migration, we migh use it to create the delegation.
### Meanwhile, the domain belongs to another account and so this block does not apply.

# ## Data lookup for parent_domain object information (which we use to reference it's zone_id when creating delegation NS records)
# ## This is current deprecated in lieu of a model getting parent_zone_id from the output of the modules used for the parent zone.
# #data "aws_route53_zone" "parent_domain" {
# #  
# #  name     = "${var.domain_name}."
# #}

# ## Route53 sub-domain delegation
# resource "aws_route53_record" "domain_delegation" {
#   count    = var.create_hosted_zone && var.delegate_subdomain ? 1 : 0

#   zone_id  = var.parent_zone_id
#   name     = var.subdomain_name
#   type     = "NS"
#   ttl      = "300"
#   records  = [aws_route53_zone.subdomain.name_servers]
# }
