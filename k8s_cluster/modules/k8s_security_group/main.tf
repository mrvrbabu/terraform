resource "aws_security_group" "mykube_sg" {
  name        = var.allow_ssh
  description = "Allow ssh"



  ingress {
    description = "This security group will allow ssh connection"
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.ssh_protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.allow_ssh
  }
}