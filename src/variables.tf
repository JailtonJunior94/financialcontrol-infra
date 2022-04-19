variable "do_token" {
  default = ""
}

variable "region" {
  default = "nyc1"
}

variable "cluster_version" {
  default = "1.22.8-do.1"
}

variable "cluster_name" {
  default = "financialcontrol-k8s"
}

variable "node_name" {
  default = "financialcontrol-node-pool"
}
variable "node_size" {
  default = "s-4vcpu-8gb"
}

variable "node_count" {
  default = 1
}

