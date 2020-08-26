variable "mykube-vpc" {
  type        = string
  description = "To create a custom vpc to deploy kube cluster"
  default     = "mykube-vpc"
}

variable "mykube_cidr_block" {
  type        = string
  description = "Default cidr to deploy the kube cluster"
  default     = "10.0.0.0/16"
}

