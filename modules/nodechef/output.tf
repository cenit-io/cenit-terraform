output "nodechef_elastic_ips" {
  value = join(
    "",
    aws_eip.this.*.public_ip,
  )
}