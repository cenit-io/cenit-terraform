# --------------------------------------------------------------------
# CloudFront distribution resources
# --------------------------------------------------------------------

## CloudFront distribution
resource "aws_cloudfront_distribution" "cdn" {
  count = var.create_distribution ? 1 : 0

  ## General settings
  comment             = var.description
  enabled             = var.is_enabled
  aliases             = var.alias
  price_class         = var.distribution_class
  default_root_object = var.default_root_object
  http_version        = var.supported_http_version
  is_ipv6_enabled     = var.ipv6_enabled

  ## Logging settings
  dynamic "logging_config" {
    for_each = var.logging_enabled ? ["true"] : []
    content {
      include_cookies = var.log_cookies
      bucket          = var.s3_bucket_access_logs
      prefix          = var.s3_access_logs_prefix
    }
  }

  ## Security settings
  web_acl_id = var.waf_acl_id

  viewer_certificate {
    acm_certificate_arn            = var.certificate_arn
    cloudfront_default_certificate = var.cloudfront_default_certificate
    iam_certificate_id             = var.iam_certificate_id
    minimum_protocol_version       = var.minimum_ssl_tls_version
    ssl_support_method             = var.ssl_client_support
  }

  ## Origin settings
  dynamic "origin" {
    for_each = local.origins
    content {
      domain_name = origin.value.domain_name
      origin_id   = origin.value.origin_id
      origin_path = lookup(origin.value, "origin_path", null)

      dynamic "custom_header" {
        for_each = lookup(origin.value, "custom_header", [])
        content {
          name  = custom_header.value.name
          value = custom_header.value.value
        }
      }

      dynamic "custom_origin_config" {
        for_each = lookup(origin.value, "custom_origin_config", [])
        content {
          http_port                = custom_origin_config.value.http_port
          https_port               = custom_origin_config.value.https_port
          origin_keepalive_timeout = lookup(custom_origin_config.value, "origin_keepalive_timeout", null)
          origin_protocol_policy   = custom_origin_config.value.origin_protocol_policy
          origin_read_timeout      = lookup(custom_origin_config.value, "origin_read_timeout", null)
          origin_ssl_protocols     = custom_origin_config.value.origin_ssl_protocols
        }
      }

      dynamic "s3_origin_config" {
        for_each = lookup(origin.value, "s3_origin_config", [])
        content {
          origin_access_identity = s3_origin_config.value.origin_access_identity
        }
      }
    }
  }
  default_cache_behavior {
    ## Default cache behavior settings 
    target_origin_id       = var.default_cache_origin_id
    viewer_protocol_policy = var.default_cache_access_protocol
    allowed_methods        = var.default_cache_allowed_http_methods
    cached_methods         = var.default_cache_cached_methods

    forwarded_values {
      headers                 = var.default_cache_headers_caching
      query_string            = var.default_cache_forward_query_strings
      query_string_cache_keys = var.default_cache_query_string_cache

      cookies {
        forward           = var.default_cache_forward_cookies
        whitelisted_names = var.default_cache_whitelisted_cookies
      }
    }

    min_ttl          = var.default_cache_min_ttl
    default_ttl      = var.default_cache_default_ttl
    max_ttl          = var.default_cache_max_ttl
    smooth_streaming = var.default_cache_smooth_streaming
    trusted_signers  = var.default_cache_trusted_signers
    compress         = var.default_cache_compress_content

    dynamic "lambda_function_association" {
      for_each = var.default_lambda_function_association
      content {
        event_type   = lambda_function_association.value.event_type
        include_body = lookup(lambda_function_association.value, "include_body", null)
        lambda_arn   = lambda_function_association.value.lambda_arn
      }
    }
  }
  ## Additional cache behaviors 
  dynamic "ordered_cache_behavior" {
    for_each = var.ordered_cache_behavior
    content {
      allowed_methods           = ordered_cache_behavior.value.allowed_methods
      cached_methods            = ordered_cache_behavior.value.cached_methods
      compress                  = lookup(ordered_cache_behavior.value, "compress", null)
      default_ttl               = lookup(ordered_cache_behavior.value, "default_ttl", null)
      field_level_encryption_id = lookup(ordered_cache_behavior.value, "field_level_encryption_id", null)
      max_ttl                   = lookup(ordered_cache_behavior.value, "max_ttl", null)
      min_ttl                   = lookup(ordered_cache_behavior.value, "min_ttl", null)
      path_pattern              = ordered_cache_behavior.value.path_pattern
      smooth_streaming          = lookup(ordered_cache_behavior.value, "smooth_streaming", null)
      target_origin_id          = ordered_cache_behavior.value.target_origin_id
      trusted_signers           = lookup(ordered_cache_behavior.value, "trusted_signers", null)
      viewer_protocol_policy    = ordered_cache_behavior.value.viewer_protocol_policy

      dynamic "forwarded_values" {
        for_each = lookup(ordered_cache_behavior.value, "forwarded_values", [])
        content {
          headers                 = lookup(forwarded_values.value, "headers", null)
          query_string            = forwarded_values.value.query_string
          query_string_cache_keys = lookup(forwarded_values.value, "query_string_cache_keys", null)

          dynamic "cookies" {
            for_each = lookup(forwarded_values.value, "cookies", [])
            content {
              forward           = cookies.value.forward
              whitelisted_names = lookup(cookies.value, "whitelisted_names", null)
            }
          }
        }
      }

      dynamic "lambda_function_association" {
        for_each = lookup(ordered_cache_behavior.value, "lambda_function_association", [])
        content {
          event_type   = lambda_function_association.value.event_type
          include_body = lookup(lambda_function_association.value, "include_body", null)
          lambda_arn   = lambda_function_association.value.lambda_arn
        }
      }
    }
  }

  ## Access restrictions
  restrictions {
    geo_restriction {
      restriction_type = var.restriction_type
      locations        = var.country_codes
    }
  }

  ## Tagging
  tags = var.tags
}

## Cloudfront Origin Access Identity (OAI)
resource "aws_cloudfront_origin_access_identity" "distribution_user" {
  count   = var.create_OAI ? 1 : 0
  comment = "Cloudfront identity for restricting public access to S3 content to this user"
}

## Create an alias record in the Route53 hosted zone, if enabled.
resource "aws_route53_record" "cloudfront_alias_record" {
  for_each = toset(var.alias)
  zone_id  = var.route53_zone_id
  name     = each.key
  type     = "A"

  alias {
    name                   = aws_cloudfront_distribution.cdn[0].domain_name
    zone_id                = aws_cloudfront_distribution.cdn[0].hosted_zone_id
    evaluate_target_health = true
  }
}

# --------------------------------------------------------------------
# CloudFront distribution resources
# --------------------------------------------------------------------

# S3 bucket for CDN
resource "aws_s3_bucket" "static_assets" {
  bucket = "cenit-static-assets-${var.environment}"
  acl    = "private"

  tags = {
    Name        = "cenit-static-assets-${var.environment}"
    Environment = var.environment
  }

  cors_rule {
    allowed_headers = []
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 2592000
  }
}

# Bucket policy
data "aws_iam_policy_document" "bucket_policy_document" {
  policy_id = "S3Access-${var.environment}-policy-cdn"
  version   = "2012-10-17"
  statement {
    sid    = "Allow-OAI-Access-To-Bucket"
    effect = "Allow"

    actions = [
      "s3:GetObject",
    ]

    resources = ["arn:aws:s3:::${aws_s3_bucket.static_assets.id}/*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${aws_cloudfront_origin_access_identity.origin_access_identity.id}"]
    }
  }
  statement {
    sid    = "Allow-IAM-Access-To-Bucket"
    effect = "Allow"

    actions = [
      "s3:PutObject",
      "s3:List*",
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.static_assets.id}/*",
      "arn:aws:s3:::${aws_s3_bucket.static_assets.id}"
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.shared_account_id}:user/circle-ci-access"]
    }
  }
}

# Bucket policy resource
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.static_assets.id
  policy = data.aws_iam_policy_document.bucket_policy_document.json
}

# Origin s3 access
resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "S3 origin access identity for the frontend ${var.environment}"
}

# --------------------------------------------------------------------
# S3 files
# --------------------------------------------------------------------
resource "aws_s3_bucket" "application_files" {
  bucket = "cenit-files-${var.environment}"
  acl    = "private"

  tags = {
    Name        = "cenit-files-${var.environment}"
    Environment = "${var.environment}"
  }
}

# IAM Access for cenit
data "aws_iam_policy_document" "s3_access" {
  policy_id = "s3_access_from_app"
  version   = "2012-10-17"
  statement {
    sid    = "s3Access"
    effect = "Allow"
    actions = [
      # "s3:List*",
      # "s3:Put*",
      # "s3:Get*"
      "s3:*" # Tight up permissions. It's not clear what permissions do you need
    ]
    resources = [
      "${aws_s3_bucket.application_files.arn}/*",
      "${aws_s3_bucket.application_files.arn}"
    ]
  }
}

resource "aws_iam_user" "app_s3_user" {
  name = "app_s3_user"
  path = "/"
}

resource "aws_iam_access_key" "app_s3_access_keys" {
  user = aws_iam_user.app_s3_user.name
}

resource "aws_ssm_parameter" "app_s3_access_key_id" {
  name        = upper("/CENIT/AWS_ACCESS_KEY_ID")
  description = "app_s3 access key id to be used by app"
  overwrite   = true
  type        = "SecureString"
  value       = aws_iam_access_key.app_s3_access_keys.id
}

resource "aws_ssm_parameter" "app_s3_secret_access_key_id" {
  name        = upper("/CENIT/AWS_SECRET_ACCESS_KEY")
  description = "app_s3 secret access key id to be used by app"
  overwrite   = true
  type        = "SecureString"
  value       = aws_iam_access_key.app_s3_access_keys.secret
}

resource "aws_iam_user_policy" "app-s3-policy" {
  name   = "s3_access_policy"
  user   = aws_iam_user.app_s3_user.name
  policy = data.aws_iam_policy_document.s3_access.json
}
