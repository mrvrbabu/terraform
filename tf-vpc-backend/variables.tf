# Declaring the variables 

variable "vpc_name" {
  type    = string
  default = "demo-vpc"

}

variable "vpc_cidr" {
  type    = string
  default = "172.31.0.0/16"

}