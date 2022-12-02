# Backened storage configuration 

terraform {
  backend "s3" {
    bucket         = "vpc-tf-statefile-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-s3-backend-tfstate-lockfile-table"
  }
}

