variable "k8s-slave-ami" {
  type        = string
  description = "K8s slave ami name"
  default     = "ami-0ac80df6eff0e70b5"
}

variable "k8s-instance-type" {
  type        = string
  description = "K8s slave instance capacity"
  default     = "t2.micro"
}
