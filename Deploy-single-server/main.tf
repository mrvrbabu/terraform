provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "ubuntu" {
  ami                    = "ami-0ac80df6eff0e70b5"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_upnrun_8081.id]
  user_data              = <<-EOF
              #!/bin/bash
              echo "Hello, Welcome to the world of terraform....." > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF


  tags = {
    Name = "upnrunning_vm01"
  }
}

resource "aws_security_group" "my_upnrun_8081" {
  name = "my_upnrun_8081"

  ingress {
    description = "Webserver port"
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.ubuntu.id
}
