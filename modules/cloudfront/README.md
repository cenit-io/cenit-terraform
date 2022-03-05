# Terraform module for CloudFront

Terraform module that provisions a CloudFront web distribution. It supports features
like the distribution price class (the edge location regions where to deploy the
distribution), a DNS alias record and its corresponding TLS certificate, storing
access logs in a given S3 bucket, as well as origin(s) (the S3 bucket or HTTP web
server from which ClouFront servers content) and caching behavior (how CF processes
the requests) settings. Specifying at least one origin and a default caching behavior
is a must for the destribution to be created.

## Origin settings

The origin(s) and the related configuration settings are specified by filling a 
mandatory variable named 'origins'. 

This approach was taken to bypass a limitation of Terraform v0.11 (the lack of 
support of dynamic configuration blocks), making this module flexible and reusable.

See the variable definition in variables.tf to get further details about all the
arguments this configuration block supports and an implementation example.

## Caching behaviors

At least one caching behavior has to be specified. This is the default one.
However, a list of serveral additional caching behaviors can be specified if the
distribution has several origins. This list is evaluated from top to bottom, in 
order of precedence.

Following the same pattern than the origin settings, fill the variable 
ordered_cache_behavior with the proper per-origin caching settings. 

Review the variable definition in variables.tf to get an implementation example
and the reference to the arguments this configuration block supports.

## ACM certificates considerations

If using an ACM Certificate with Amazon CloudFront, you must request or import 
the certificate in the us-east-1 region (N. Virginia). ACM Certificates in this
region that are associated with a CloudFront distribution are then distributed
to all the geographic locations configured for that distribution.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alias | An Alternate Domain Name (CNAME) we want for this distribution | string | n/a | yes |
| certificate\_arn | The ARN of the ACM certificate to use with this distribution, if using an alternate domain | string | `""` | no |
| cloudfront\_default\_certificate | True if we are using the CloudFront domain name for the distribution and not an alternate domain (CNAME) | string | `"false"` | no |
| country\_codes | A list of country codes to allow or deny access to the content based on the restriction type | list | `<list>` | no |
| create\_OAI | If true, a user will be created to restric S3 access to this user only | string | `"true"` | no |
| create\_distribution | True if a CF distribution is going to be created | string | n/a | yes |
| default\_cache\_access\_protocol | The protocol to access the files in the origin (default_cache_origin_id) when matching the path pattern | string | `"redirect-to-https"` | no |
| default\_cache\_allowed\_http\_methods | Which HTTP methods CloudFront processes and forwards to the origin (default_cache_origin_id) | list | `<list>` | no |
| default\_cache\_cached\_methods | CloudFront will cache the response to requests using the specified HTTP methods. | list | `<list>` | no |
| default\_cache\_compress\_content | True if we want CloudFront to compress content for requests that specify it in the request header | string | `"true"` | no |
| default\_cache\_default\_ttl | The default amount of time, in seconds, you want objects to stay in CloudFront caches | string | `"86400"` | no |
| default\_cache\_forward\_cookies | Whether the CloudFront distribution forwards cookies to the origin [none|whitelist|all] | string | `"none"` | no |
| default\_cache\_forward\_query\_strings | Whether the CloudFront distribution forwards query strings to the origin | string | `"false"` | no |
| default\_cache\_headers\_caching | Specifies the headers, if any, you want CloudFront to vary upon for the default cache behavior | list | `<list>` | no |
| default\_cache\_max\_ttl | The maximum amount of time, in seconds, that you want objects to stay in CloudFront caches | string | `"2592000"` | no |
| default\_cache\_min\_ttl | The minimum amount of time, in seconds, that you want objects to stay in cache | string | `"0"` | no |
| default\_cache\_origin\_id | The origin ID you want CloudFront to route requests to, when a request matches the path pattern | string | n/a | yes |
| default\_cache\_query\_string\_cache | If query string forwarding is enabled, which query strings are cached | list | `<list>` | no |
| default\_cache\_smooth\_streaming | True if we distribute media files in Microsoft Smooth Streaming format from the default origin | string | `"false"` | no |
| default\_cache\_trusted\_signers | What AWS accounts can create signed URLs to access a private content | list | `<list>` | no |
| default\_cache\_whitelisted\_cookies | If whitelist cookies are forwarded, specify the ones you want CloudFront to forward the origin | list | `<list>` | no |
| default\_root\_object | The object we want CloudFront to return when the root URL is requested | string | `"index.html"` | no |
| description | A comment describing the purpose of the CF distribution | string | `""` | no |
| distribution\_class | The geographic edge locations regions to use. | string | n/a | yes |
| domain | The DNS domain where to add the alias record. Needed to get the hosted zone id | string | `""` | no |
| iam\_certificate\_id | The ID of the certificate imported in IAM if using an external certificate for alternate CNAMEs | string | `""` | no |
| ipv6\_enabled | True if IPv6 is enabled for the distribution | string | `"true"` | no |
| is\_enabled | Whether the distribution is enabled to accept end user requests | string | `"true"` | no |
| log\_cookies | True if we want to include cookies in the access logs | string | n/a | yes |
| minimum\_ssl\_tls\_version | The minimum version of the SSL/TLS protocol that you want CloudFront to use for HTTPS connections. | string | `"TLSv1.1_2016"` | no |
| ordered\_cache\_behavior | If needed, an ordered list of additional cache behaviors can be specified | list | `<list>` | no |
| origins | A mandatory list of one or more origins and its/their corresponding settings for this distribution | list | n/a | yes |
| restriction\_type | The method to use to restrict the content distribution by country [none|whitelist|blacklist] | string | `"none"` | no |
| route53\_alias\_record | If true, the CNAME record for this distribution will be created in the corresponding Route53 hosted zone | string | n/a | yes |
| s3\_access\_logs\_prefix | A string to prefix CloudFront access log filenames for this distribution | string | `""` | no |
| s3\_bucket\_access\_logs | The S3 bucket to store access logs in | string | n/a | yes |
| ssl\_client\_support | Specifies how you want CloudFront to serve HTTPS requests | string | `"sni-only"` | no |
| supported\_http\_version | Maximum HTTP version supported by the distribution [http1.1|http2] | string | `"http2"` | no |
| tags | A map of tags to atach to the CloudFront distribution | map | `<map>` | no |
| waf\_acl\_id | The WAF ACL id to associate with the distribution to filter CloudFront requests | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| distribution\_arn | Cloudfront distribution ARN. |
| distribution\_id | Cloudfront distribution ID. |
| distribution\_oai | Cloudfront distribution Origin Access Identity ARN. |
| distribution\_oai\_path | Cloudfront distribution Origin Access Identity path. |
| domain\_name | Cloudfront distribution domain name. |
| hosted\_zone\_id | Cloudfront distribution hosted zone ID. |
