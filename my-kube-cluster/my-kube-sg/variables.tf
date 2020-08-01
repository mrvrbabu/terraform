variable "allow_ssh" {
    type = string 
    description = "ssh security name" 
    default = "mykube_ssh_sg"
}

variable "from_port" {
    default = 22
}

variable "to_port" {
    default = 22 
}

variable "ssh_protocol" {
    type = string 
    default = "tcp"
}

variable "ssh_cidr_block" {
    type = string 
    default = "0.0.0.0/0"
}