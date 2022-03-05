output "zone_id" {
  value = join("", aws_route53_zone.subdomain.*.zone_id)
}

output "name_servers" {
  value = aws_route53_zone.subdomain.*.name_servers
}

output "parent_domain_name" {
  value = var.domain_name
}

output "subdomain_name" {
  value = var.subdomain_name
}

output "fqdn" {
  value = "${var.subdomain_name}.${var.domain_name}"
}

output "parent_zone_id" {
  value = var.parent_zone_id
}
