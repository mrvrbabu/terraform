resource "aws_vpc" "newvpc" {
  cidr_block = var.mykube_cidr_block
  tags = {
    Name = var.mykube-vpc
  }
}