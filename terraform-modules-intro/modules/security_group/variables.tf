variable "from_port" {
    description = "Source port"
    default = 22
}

variable  "to_port" {
    description = "Destination port" 
    default     = 22
}

variable "from_out_port" {
    description = "Source port to outside world" 
    default = 0
}

variable "to_out_port" {
    description = "To outside world port"
    default    = 0
}

variable "ssh_protocol" {
    description = "ssh protocol tcp/udp"
    default = "tcp"
}

variable "to_out_protocol" {
    description = "ssh protocol tcp/udp"
    default = "tcp"
}