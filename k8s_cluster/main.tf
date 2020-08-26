provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

module "mykube_vpc" {
  source = "./modules/k8s_vpc"
}

module "mykube_sg" {
  source = "./modules/k8s_security_group"
}

module "mykube_k8s_master" {
  source = "./modules/k8s_master"
}

module "mykube_k8s_slave" {
  source = "./modules/k8s_slave"
}

