provider "aws" {
  region = "us-west-2"
}

module "s3_bucket" {
  source  = "../../"

  bucket_name            = "example-bucket"
  acl                    = "private"
  versioning             = true
  lifecycle_enabled      = true
  lifecycle_transition_days = 30
  lifecycle_expiration_days = 365
  sse_algorithm          = "AES256"
  environment            = "test"
  tags                   = {
    "Owner" = "example"
  }
  read_access_principals = ["arn:aws:iam::123456789012:role/ReadAccessRole"]
  write_access_principals = ["arn:aws:iam::123456789012:role/WriteAccessRole"]
}
