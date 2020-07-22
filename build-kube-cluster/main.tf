provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_key_pair" "kubecluster-key" {
  key_name   = "kubecluster-key"
  public_key = file("kubecluster-key.pub")
}

resource "aws_instance" "kubemaster01" {
  key_name               = aws_key_pair.kubecluster-key.key_name
  ami                    = "ami-0a0ddd875a1ea2c7f"
  instance_type          = "t2.medium"
  vpc_security_group_ids = ["sg-37cfcb11", "sg-0c9993156f69f7bba", "sg-04f5a6d71870ce99d"]

  tags = {
    Name = "kubemaster01"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("kubecluster-key")
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "app.py"
    destination = "/tmp/app.py"
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
      "sudo apt-get install -y kubeadm=1.14.2-00 kubectl=1.14.2-00 kubelet=1.14.2-00",
      "MASTERIP=`hostname -i`",
      "KUBEVERSION=\"v1.14.2\"",
      "sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=$MASTERIP --kubernetes-version $KUBEVERSION",
      "sudo mkdir -p $HOME/.kube",
      "sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config",
      "sudo chown $(id -u):$(id -g) $HOME/.kube/config",
      "sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml"
    ]
  }
}

resource "aws_instance" "kubeslave01" {
  key_name               = aws_key_pair.kubecluster-key.key_name
  ami                    = "ami-0a0ddd875a1ea2c7f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-37cfcb11", "sg-0c9993156f69f7bba", "sg-04f5a6d71870ce99d"]

  tags = {
    Name = "kubeslave01"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("kubecluster-key")
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "app.py"
    destination = "/tmp/app.py"
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
resource "aws_instance" "kubeslave02" {
  key_name               = aws_key_pair.kubecluster-key.key_name
  ami                    = "ami-0a0ddd875a1ea2c7f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-37cfcb11", "sg-0c9993156f69f7bba", "sg-04f5a6d71870ce99d"]

  tags = {
    Name = "kubeslave02"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("kubecluster-key")
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "app.py"
    destination = "/tmp/app.py"
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
resource "aws_eip" "kubemaster01" {
  vpc      = true
  instance = aws_instance.kubemaster01.id
}

resource "aws_eip" "slaveip01" {
  vpc      = true
  instance = aws_instance.kubeslave01.id
}

resource "aws_eip" "slaveip02" {
  vpc      = true
  instance = aws_instance.kubeslave02.id
}

