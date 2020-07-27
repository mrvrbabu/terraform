terraform {
  required_version = "~> 0.12"
}

provider "aws" {
  profile = "default"
  region  = var.region
}

module "security_group" {
  source = "./modules/security_group"
}

module "keycloak_server" {
  source = "./modules/keycloak_server"
}

module "vault_server" {
  source = "./modules/vault_server"
  #vpc_security_group_ids = [module.security_group.ssh_sg.id]
}