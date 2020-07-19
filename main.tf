provider "aws" {
  profile	= "default"
  region 	= "us-east-1"
}

resource "aws_key_pair" "my_all_good_key" {
	key_name	= "all_good_key"
	public_key	= file("all_good_key.pub")
}

resource "aws_instance" "scratchvm01" {
	key_name	= aws_key_pair.my_all_good_key.key_name
	ami		= "ami-0ac80df6eff0e70b5"
	instance_type	= "t2.micro"
        vpc_security_group_ids = ["sg-37cfcb11","sg-0c9993156f69f7bba","sg-04f5a6d71870ce99d"]
tags = {
	Name 		= "allgoodvm"
}

  connection {
	type		= "ssh"
	user		= "ubuntu"
	private_key     = file("all_good_key")
	host		= self.public_ip
	}
  provisioner "file" {
	source		="app.py"
	destination	="/tmp/app.py" 
}
  provisioner "remote-exec" {
	inline		= [
	"sudo apt-get update -y && sudo apt-get install -y python-pip",
	"pip install flask"
	]
}
}

resource "aws_eip" "ip" {
	vpc		= true
	instance	= aws_instance.scratchvm01.id
}
