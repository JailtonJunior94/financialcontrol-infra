variable "do_token" {
  default = "dop_v1_a5bc33efb83a157c8b59061f9fb3bed2392167612773993a9d93404963a48c21"
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
  default = "s-1vcpu-2gb"
}

variable "node_count" {
  default = 1
}

