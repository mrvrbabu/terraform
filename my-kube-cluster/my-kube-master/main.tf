resource "aws_key_pair" "my-k8s-master-key" {
    key_name = "k8s-master-key"
    public_key = file("k8s-master-key.pub")
}

resource "aws_instance" "k8s-master" {
    key_name = aws_key_pair.my-k8s-master-key.key_name
    ami = var.k8s-master-ami 
    instance_type = var.k8s-instance-type 

    tags = {
        Name = "k8s-master"
    }
}