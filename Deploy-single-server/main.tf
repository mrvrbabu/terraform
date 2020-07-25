provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myterraformvm01" {
  ami           = "ami-0ac80df6eff0e70b5"
  instance_type = "t2.micro"
  tags = {
    Name = "myterraform_vm01"
  }
}