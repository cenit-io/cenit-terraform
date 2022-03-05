output "distribution_id" {
  description = "The cloudfront distribution ID"
  value       = aws_cloudfront_distribution.cdn.*.id
}

output "domain_name" {
  description = "The cloudfront distribution domain name"
  value = join(
    "",
    aws_cloudfront_distribution.cdn.*.domain_name,
  )
}

output "distribution_arn" {
  description = "The cloudfront distribution ARN"
  value       = aws_cloudfront_distribution.cdn.*.arn
}

output "distribution_oai" {
  description = "Cloudfront distribution Origin Access Identity ARN"
  value = join(
    "",
    aws_cloudfront_origin_access_identity.distribution_user.*.iam_arn,
  )
}

output "distribution_oai_path" {
  description = "Cloudfront distribution Origin Access Identity path"
  value = join(
    "",
    aws_cloudfront_origin_access_identity.distribution_user.*.cloudfront_access_identity_path,
  )
}

output "hosted_zone_id" {
  description = "Cloudfront distribution hosted zone ID"
  value = join(
    "",
    aws_cloudfront_distribution.cdn.*.hosted_zone_id,
  )
}

