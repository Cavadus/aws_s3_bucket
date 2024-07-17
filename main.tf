resource "aws_s3_bucket" "my_test_bucket" {
  bucket = var.bucket_name

  tags = merge({
    "Name"        = var.bucket_name
    "Environment" = var.environment
  }, var.tags)

}

resource "aws_s3_bucket_acl" "my_test_bucket" {
  bucket = aws_s3_bucket.my_test_bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_lifecycle_configuration" "my_test_bucket" {
  bucket = aws_s3_bucket.my_test_bucket.id

  rule {
    id = var.lifecycle_id

    transition {
      days          = var.lifecycle_transition_days
      storage_class = var.lifecycle_transition_storage_class
    }

    expiration {
      days = var.lifecycle_expiration_days
    }

    status = var.lifecycle_enabled
  }
}

resource "aws_s3_bucket_policy" "my_test_bucket" {
  bucket = aws_s3_bucket.my_test_bucket.id
  policy = data.aws_iam_policy_document.my_test_bucket.json
}

resource "aws_s3_bucket_server_side_encryption_configuration" "my_test_bucket" {
  bucket = aws_s3_bucket.my_test_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_versioning" "my_s3_bucket_versioning" {
      bucket = aws_s3_bucket.my_test_bucket.arn
      versioning_configuration {
        status = true
      }
    }

data "aws_iam_policy_document" "my_test_bucket" {
  statement {
    actions   = ["s3:GetObject"]
    resources = [join("", [aws_s3_bucket.my_test_bucket.arn, "/*"])]

    principals {
      type        = "AWS"
      identifiers = var.read_access_principals
    }
  }

  statement {
    actions   = ["s3:PutObject"]
    resources = [join("", [aws_s3_bucket.my_test_bucket.arn, "/*"])]

    principals {
      type        = "AWS"
      identifiers = var.write_access_principals
    }
  }
}
