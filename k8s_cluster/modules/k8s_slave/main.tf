resource "aws_key_pair" "my-k8s-slave-key" {
  key_name   = "k8s-slave-key"
  public_key = file("k8s-slave-key.pub")
}

resource "aws_instance" "k8s-slave" {
  key_name      = aws_key_pair.my-k8s-slave-key.key_name
  ami           = var.k8s-slave-ami
  instance_type = var.k8s-instance-type
  #vpc_security_group_ids = ["sg-0010062d25d7c2d1e", "sg-37cfcb11"]

  tags = {
    Name = "k8s-slaves"
  }
  count = 2

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("k8s-slave-key")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install docker.io -y",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo apt-get install apt-transport-https curl -y",
      "sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add",
      "sudo echo \"deb http://apt.kubernetes.io/ kubernetes-xenial main\" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list && sudo apt-get update",
      "sudo swapoff -a",
      "sudo apt-get install kubernetes-cni=0.7.5-00 -y",
      "sudo apt-get install -y kubeadm=1.14.2-00 kubectl=1.14.2-00 kubelet=1.14.2-00"
    ]
  }
}