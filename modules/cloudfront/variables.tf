# -------------------------------------------------------------
# General distribution variables
# -------------------------------------------------------------

variable "region" {
  default = "us-east-1"
}

variable "environment" {
  type = string
}

variable "create_distribution" {
  description = "True if a CF distribution is going to be created"
}

variable "description" {
  description = "A comment describing the purpose of the CF distribution"
  default     = ""
}

variable "is_enabled" {
  description = "Whether the distribution is enabled to accept end user requests"
  default     = true
}

variable "alias" {
  description = "An Alternate Domain Name (CNAME) we want for this distribution"
  type        = list(string)
}

variable "route53_alias_record" {
  description = "If true, the CNAME record for this distribution will be created in the corresponding Route53 hosted zone"
  default     = false
}

variable "domain" {
  description = "The DNS domain where to add the alias record. Needed to get the hosted zone id"
  default     = ""
}

variable "route53_zone_id" {
  description = "zone_id value to create CDN"
  type        = string
  default     = ""
}

variable "distribution_class" {
  description = "The geographic edge locations regions to use."
  # PriceClass_100 : Use only edge locations in US, Canada and Europe
  # PriceClass_200 : Use edge locations in US, Canada, Europe, Asia and Africa
  # PriceClass_All : Use All edge locations (best performance ; higher costs)
}

variable "default_root_object" {
  description = "The object we want CloudFront to return when the root URL is requested"
  default     = "index.html"
}

variable "supported_http_version" {
  description = "Maximum HTTP version supported by the distribution [http1.1|http2]"
  default     = "http2"
}

variable "ipv6_enabled" {
  description = "True if IPv6 is enabled for the distribution"
  default     = false
}

# -------------------------------------------------------------
# Distribution logging variables
# -------------------------------------------------------------
variable "logging_enabled" {
  type        = bool
  default     = false
  description = "When true, access logs will be sent to a newly created s3 bucket"
}

variable "s3_bucket_access_logs" {
  description = "The S3 bucket to store access logs in"
  default     = ""
}

variable "log_cookies" {
  description = "True if we want to include cookies in the access logs"
  default     = false
}

variable "s3_access_logs_prefix" {
  description = "A string to prefix CloudFront access log filenames for this distribution"
  default     = ""
}

# -------------------------------------------------------------
# Distribution security variables
# -------------------------------------------------------------

variable "waf_acl_id" {
  description = "The WAF ACL id to associate with the distribution to filter CloudFront requests"
  default     = ""
}

variable "certificate_arn" {
  description = "The ARN of the ACM certificate to use with this distribution, if using an alternate domain"
  default     = ""
  # The ACM certificate must be in US-EAST-1
}

variable "cloudfront_default_certificate" {
  description = "True if we are using the CloudFront domain name for the distribution and not an alternate domain (CNAME)"
  default     = false
}

variable "iam_certificate_id" {
  description = "The ID of the certificate imported in IAM if using an external certificate for alternate CNAMEs"
  default     = ""
}

variable "minimum_ssl_tls_version" {
  description = "The minimum version of the SSL/TLS protocol that you want CloudFront to use for HTTPS connections."
  default     = "TLSv1.1_2016"
  # Available versions: SSLv3, TLSv1, TLSv1_2016, TLSv1.1_2016, TLSv1.2_2018
}

variable "ssl_client_support" {
  description = "Specifies how you want CloudFront to serve HTTPS requests"
  default     = "sni-only"
  # sni-only : Only Clients that Support Server Name Indication (SNI) - TLSv1 or later
  # vip: All Clients. CloudFront allocates dedicated virtual IP addresses at each CloudFront edge location (extra costs) - SSLv3 or TLSv1
}

# -------------------------------------------------------------
# Distribution origin variables
# -------------------------------------------------------------

# variable "origins" {
#   description = "A mandatory list of one or more origins and its/their corresponding settings for this distribution"
#   type        = any
#   # Ref: https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html#origin-arguments
#   #
#   # example:
#   #
#   # origins = [ 
#   # {  
#   #   origin_id   = "S3"  ## S3 bucket configured as Website endpoint must be configured by using CustomOriginConfig
#   #   domain_name = "<bucket>.s3-website-us-east-1.amazonaws.com" 
#   #   origin_path = ""
#   #
#   #   custom_origin_config = [{
#   #     http_port  = 80
#   #     https_port = 443
#   #     origin_protocol_policy   = "https-only"
#   #     origin_ssl_protocols     = ["TLSv1.2","TLSv1.1"]
#   #     origin_keepalive_timeout = 5
#   #     origin_read_timeout      = 30
#   #   }]
#   # },
#   # {
#   #   origin_id   = "S3-objects"  ## S3 bucket serving objects via CF distribution
#   #   domain_name = "<bucket-name>.s3.<region>.amazonaws.com"
#   #
#   #   s3_origin_config {
#   #     origin_access_identity = "origin-access-identity/cloudfront/<id>"
#   #   }
#   # },
#   # {
#   #   origin_id   = "ELB"
#   #   domain_name = "<elb-name>.us-east-1.elb.amazonaws.com" 
#   #   origin_path = ""
#   #
#   #   custom_origin_config = [{
#   #     http_port  = 80
#   #     https_port = 443
#   #     origin_protocol_policy   = "https-only"
#   #     origin_ssl_protocols     = ["TLSv1.2","TLSv1.1"]
#   #     origin_keepalive_timeout = 5
#   #     origin_read_timeout      = 30
#   #   }]
#   # }]
#   #
# }

# -------------------------------------------------------------
# Default cache behavior variables
# -------------------------------------------------------------

variable "default_cache_origin_id" {
  description = "The origin ID you want CloudFront to route requests to, when a request matches the path pattern"
}

variable "default_cache_access_protocol" {
  description = "The protocol to access the files in the origin (default_cache_origin_id) when matching the path pattern"
  default     = "redirect-to-https"
  # Available options: allow-all,https-only,redirect-to-https
}

variable "default_cache_allowed_http_methods" {
  description = "Which HTTP methods CloudFront processes and forwards to the origin (default_cache_origin_id)"
  type        = list(string)
  default     = ["GET", "HEAD"]
  # Available methods:
  # GET, HEAD
  # GET, HEAD, OPTIONS
  # GET, HEAD, OPTIONS, PUT, POST, PATCH, DELETE
}

variable "default_cache_cached_methods" {
  description = "CloudFront will cache the response to requests using the specified HTTP methods."
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "default_cache_headers_caching" {
  description = "Specifies the headers, if any, you want CloudFront to vary upon for the default cache behavior"
  type        = list(string)
  default     = []
  # Specify * to include all headers
}

variable "default_cache_forward_query_strings" {
  description = "Whether the CloudFront distribution forwards query strings to the origin"
  default     = false
}

variable "default_cache_query_string_cache" {
  description = "If query string forwarding is enabled, which query strings are cached"
  type        = list(string)
  default     = []
  # When omitted, and forwarding is enabled, all query string keys are cached.
}

variable "create_OAI" {
  description = "If true, a user will be created to restric S3 access to this user only"
  default     = true
}

variable "default_cache_forward_cookies" {
  description = "Whether the CloudFront distribution forwards cookies to the origin [none|whitelist|all]"
  default     = "none"
}

variable "default_cache_whitelisted_cookies" {
  description = "If whitelist cookies are forwarded, specify the ones you want CloudFront to forward the origin"
  type        = list(string)
  default     = []
}

variable "default_cache_min_ttl" {
  description = "The minimum amount of time, in seconds, that you want objects to stay in cache"
  default     = null
}

variable "default_cache_default_ttl" {
  description = "The default amount of time, in seconds, you want objects to stay in CloudFront caches"
  default     = null
}

variable "default_cache_max_ttl" {
  description = "The maximum amount of time, in seconds, that you want objects to stay in CloudFront caches"
  default     = null
}

variable "default_cache_trusted_signers" {
  description = "What AWS accounts can create signed URLs to access a private content"
  type        = list(string)
  default     = []
}

variable "default_cache_smooth_streaming" {
  description = "True if we distribute media files in Microsoft Smooth Streaming format from the default origin"
  default     = false
}

variable "default_cache_compress_content" {
  description = "True if we want CloudFront to compress content for requests that specify it in the request header"
  default     = true
}

variable "default_lambda_function_association" {
  type = list(object({
    event_type   = string
    include_body = bool
    lambda_arn   = string
  }))

  description = "A config block that triggers a lambda function with specific actions"
  default     = []
}

# -------------------------------------------------------------
# Additional cache behaviors
# -------------------------------------------------------------

variable "ordered_cache_behavior" {
  description = "If needed, an ordered list of additional cache behaviors can be specified"
  type        = any
  default     = []
  # List evaluated from top to bottom, in order of precedence.
  # Ref: https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html#cache-behavior-arguments
  #
  # example:
  #
  # ordered_cache_behavior = [
  # {  
  #   target_origin_id = "<elb-origin-id>"
  #   path_pattern     = "/api/*"
  #   viewer_protocol_policy = "redirect-to-https"
  #   allowed_methods  = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
  #   cached_methods   = ["GET", "HEAD"]
  #
  #   forwarded_values = [{
  #     query_string = true
  #
  #     cookies = [{
  #       forward = "all"
  #     }]
  #   }]
  #
  #   min_ttl     = 0
  #   default_ttl = 0
  #   max_ttl     = 0
  #   compress    = false
  #
  #   lambda_function_association {
  #     event_type   = "origin-response"
  #     lambda_arn   = "<lambda-function-arn>"
  #     include_body = "false"
  #   }
  # },
  # {
  #   target_origin_id = "<s3-origin-id>"
  #   path_pattern     = "/admin/*"
  #   viewer_protocol_policy = "redirect-to-https"
  #   allowed_methods  = ["GET", "HEAD"]
  #   cached_methods   = ["GET", "HEAD"]
  #
  #   forwarded_values {
  #     query_string = false
  #
  #     cookies {
  #       forward = "none"
  #     }
  #   }
  #
  #   min_ttl     = 0
  #   default_ttl = 86400
  #   max_ttl     = 31536000
  #   compress    = false
  #
  #   lambda_function_association {
  #     event_type   = "origin-response"
  #     lambda_arn   = "<lambda-function-arn>"
  #     include_body = "false"
  #   }
  # }]
  # 
}

# -------------------------------------------------------------
# Distribution access restrictions
# -------------------------------------------------------------

variable "restriction_type" {
  description = "The method to use to restrict the content distribution by country [none|whitelist|blacklist]"
  default     = "none"
}

variable "country_codes" {
  description = "A list of country codes to allow or deny access to the content based on the restriction type"
  type        = list(string)
  default     = []
}

# -------------------------------------------------------------
# Tagging
# -------------------------------------------------------------

variable "tags" {
  description = "A map of tags to attach to the CloudFront distribution"
  type        = map(string)
  default     = {}
}

variable "shared_account_id" {
  description = "Shared account id for circleci user"
}