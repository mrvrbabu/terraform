# terraform getting started
```
Refer terraform getting started - https://learn.hashicorp.com/terraform/getting-started/build 
Prerequest = aws account, aws client, aws access key id, Secret Access key

$ aws configure
$ mkdir learn-terraform-aws-instance
$ cd learn-terraform-aws-instance
$ touch example.tf 
$ terraform fmt                             # Format syntax errors
$ terraform validate                        # Fix dependency files such as templates, keys, etc
$ terraform init                            # Initialize terraform.
$ terraform state list                      # Terraform has a built in command called terraform state for advanced state management.
$ terraform plan -out vpc-creation.txt      # Execute plan 
$ terraform apply  vpc-creation.txt         # Create infrastructure from txt file 
$ terraform apply                           # Create infrastructure 
$ terraform show                            # When you applied your configuration, Terraform wrote data into a file called terraform.tfstate. This file now contains the IDs and properties of the resources Terraform created so that it can manage or destroy those resources going forward.
$ terraform stage list  

$ terraform destroy                         # To destroy the infra 
$ terraform destroy --auto-approve          # autoappove to destroy the infra 



$ Run "sudo nohup python /tmp/app.py > log.txt 2>&1 & " to start the flask server and can be access on public ip and port 8080




Courtesy

Demo | Three-tier web app in AWS with VPC, ALB, EC2 & RDS
https://www.youtube.com/watch?v=sCBTeMd0Jj4

terraform backend configuration video
https://www.youtube.com/watch?v=q5-zsBY90j8


Three-tier architecture in AWS using Terraform
https://www.youtube.com/watch?v=Hl81P5CrBSk

```