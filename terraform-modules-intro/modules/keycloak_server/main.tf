resource "aws_instance" "mykeycloak_server" {
    ami = var.instance_ami
    instance_type = var.instance_type 

    user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "keycloak-server"
  }

}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.mykeycloak_server.id
}
