# Step 1 is to create a backend.tf file and create the S3 and DynamoDB resources.
# The S3 will store the state file and the DynamoDB table will enable state locking.

# Create S3 bucket with versioning enabled.

resource "aws_s3_bucket" "yeylebucket7" {
  bucket = "yeyles3bucketproject"
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}


# DynamoDB with server side encryption enabled.

resource "aws_dynamodb_table" "statelock" {
  name = "state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
