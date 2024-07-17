package test

import (
  "testing"
  "github.com/gruntwork-io/terratest/modules/aws"
  "github.com/gruntwork-io/terratest/modules/terraform"
  "github.com/stretchr/testify/assert"
)

func TestS3Bucket(t *testing.T) {
  opts := &terraform.Options{
    TerraformDir: "../examples/simple",
  }

  defer terraform.Destroy(t, opts)

  terraform.InitAndApply(t, opts)

  bucketID := terraform.Output(t, opts, "bucket_id")
  bucketArn := terraform.Output(t, opts, "bucket_arn")
  bucketDomainName := terraform.Output(t, opts, "bucket_domain_name")

  assert.NotEmpty(t, bucketID)
  assert.NotEmpty(t, bucketArn)
  assert.NotEmpty(t, bucketDomainName)

  aws.AssertS3BucketExists(t, "us-west-2", bucketID)
}
