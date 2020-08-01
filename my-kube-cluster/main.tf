provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

module "mykube_vpc" {
  source = "./my-kube-vpc"
}

module "mykube_sg" {
  source = "./my-kube-sg"
}

module "mykube_k8s_master" {
  source = "./my-kube-master"
}

module "mykube_k8s_slave" {
  source = "./my-kube-slave"
}

