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
  ami                    = "ami-0ac80df6eff0e70b5"
  instance_type          = "t2.micro"
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
      "sudo apt-get update"
    ]
  }
}

resource "aws_instance" "kubeslave01" {
  key_name               = aws_key_pair.kubecluster-key.key_name
  ami                    = "ami-0ac80df6eff0e70b5"
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
      "sudo apt-get update"
    ]
  }
}
resource "aws_instance" "kubeslave02" {
  key_name               = aws_key_pair.kubecluster-key.key_name
  ami                    = "ami-0ac80df6eff0e70b5"
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
      "sudo apt-get update"
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

