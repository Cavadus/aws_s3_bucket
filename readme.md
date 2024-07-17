# S3 Bucket Module

This Terraform module creates an S3 bucket with best practices for security, scalability, reliability, and reuse.

## Usage

```hcl
module "s3_bucket" {
  source  = "path_to_your_module"

  bucket_name            = "my-bucket"
  acl                    = "private"
  versioning             = true
  lifecycle_enabled      = true
  lifecycle_transition_days = 30
  lifecycle_expiration_days = 365
  sse_algorithm          = "AES256"
  environment            = "prod"
  tags                   = {
    "Owner" = "user"
  }
  read_access_principals = ["arn:aws:iam::123456789012:role/ReadAccessRole"]
  write_access_principals = ["arn:aws:iam::123456789012:role/WriteAccessRole"]
}

output "bucket_id" {
  value = module.s3_bucket.bucket_id
}

output "bucket_arn" {
  value = module.s3_bucket.bucket_arn
}

output "bucket_domain_name" {
  value = module.s3_bucket.bucket_domain_name
}
