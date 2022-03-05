locals {
  # Origin settings
  origins = [
    {
      origin_id   = "S3"
      domain_name = aws_s3_bucket.static_assets.bucket_domain_name

      s3_origin_config = [{
        origin_access_identity = "origin-access-identity/cloudfront/${aws_cloudfront_origin_access_identity.origin_access_identity.id}"
      }]
    },
  ]
}