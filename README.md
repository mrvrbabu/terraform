# terraform getting started
Refer terraform getting started - https://learn.hashicorp.com/terraform/getting-started/build 
Prerequest = aws account, aws client, aws access key id, Secret Access key

$ aws configure
$ mkdir learn-terraform-aws-instance
$ cd learn-terraform-aws-instance
$ touch example.tf 
$ terraform fmt           # Format syntax errors
$ terraform validate   # Fix dependency files such as templates, keys, etc
$ terraform init           # Initialize terraform.
$ terraform state list  # Terraform has a built in command called terraform state for advanced state management.
$ terraform apply       # Create infrastructure 
$ terraform show        # When you applied your configuration, Terraform wrote data into a file called terraform.tfstate. This file now contains the IDs and properties of the resources Terraform created so that it can manage or destroy those resources going forward.
$ terraform stage list  # 

$ terraform destroy      # To destroy the infra 

