resource "aws_key_pair" "my-k8s-slave-key" {
    key_name = "k8s-slave-key"
    public_key = file("k8s-slave-key.pub")
}

resource "aws_instance" "k8s-slave" {
    key_name = aws_key_pair.my-k8s-slave-key.key_name
    ami = var.k8s-slave-ami 
    instance_type = var.k8s-instance-type 

    tags = {
        Name = "k8s-slaves"
    }
    count = 2
}