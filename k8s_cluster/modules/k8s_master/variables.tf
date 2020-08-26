variable "k8s-master-ami" {
  type        = string
  description = "K8s master ami name"
  default     = "ami-0ac80df6eff0e70b5"
}

variable "k8s-instance-type" {
  type        = string
  description = "K8s master instance capacity"
  default     = "t2.medium"
}
