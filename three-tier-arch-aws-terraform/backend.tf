# Create the below backend s3 bucket and dynamo_db with partition Key as 'LockID' table before creating the vpc
# https://developer.hashicorp.com/terraform/language/settings/backends/s3

terraform {
  backend "s3" {
    bucket         = "enterprise-client-s3-tfstatefile-bucket"
    encrypt        = true
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "enterprise-client-dynamodb-tfstate-lock-backend"
  }
}