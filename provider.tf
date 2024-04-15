# This is the provider block with the backend code.
# Once you have created the S3 & the DynamoDB table, then add the "backend" code to the provider block.
# The state file will be stored in the S3 bucket we've created in backend.tf 

terraform {
  backend "s3" {
    bucket = "yeyles3bucketproject"
    dynamodb_table = "state-lock"
    key = "mystatefile/terrafor.tfstate"
    region = "us-east-2"
    encrypt = true
    
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
    region = "us-east-2"
    access_key = "#########"
    secret_key = "#########"
}
