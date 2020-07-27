resource "aws_security_group" "ssh_sg" {
    name    = "Allow_ssh_connection" 
    description = "Allow SSH"

    ingress {
        description = "SSH" 
        from_port   = var.from_port 
        to_port     = var.to_port
        protocol    = var.ssh_protocol
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = var.from_out_port
        to_port   = var.to_out_port
        protocol    = var.to_out_protocol
        cidr_blocks = ["0.0.0.0/0"]
    }
}

