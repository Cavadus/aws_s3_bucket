output "bucket_id" {
  description = "The ID of the S3 bucket."
  value       = aws_s3_bucket.my_test_bucket.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket."
  value       = aws_s3_bucket.my_test_bucket.arn
}

output "bucket_domain_name" {
  description = "The domain name of the S3 bucket."
  value       = aws_s3_bucket.my_test_bucket.bucket_domain_name
}
