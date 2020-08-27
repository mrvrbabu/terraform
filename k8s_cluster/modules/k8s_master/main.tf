resource "aws_key_pair" "my-k8s-master-key" {
  key_name   = "k8s-master-key"
  public_key = file("k8s-master-key.pub")
}

resource "aws_instance" "k8s-master" {
  key_name      = aws_key_pair.my-k8s-master-key.key_name
  ami           = var.k8s-master-ami
  instance_type = var.k8s-instance-type
  #vpc_security_group_ids = ["sg-0010062d25d7c2d1e", "sg-37cfcb11"]

  tags = {
    Name = "k8s-master"
  }

  provisioner "file" {
    # Copy all files from conf/ folder to /opt for execution
    source      = "${path.module}/../../conf/"
    destination = "/tmp"


  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("k8s-master-key")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/*.sh",
      "sleep 7",
      "/tmp/common.sh"
    ]
  }
}