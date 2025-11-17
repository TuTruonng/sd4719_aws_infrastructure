variable "cluster_name" {
  type    = string
  default = "demo-eks-cluster"
}

variable "vpc_id" {
  type = string
}

variable "worker_nodes_private_subnets" {
  description = "Specifies the subnets for the cluster's worker nodes."
  type = list(string)
}

variable "control_plane_private_subnets" {
  description = "Specifies the subnets for the EKS control plane's ENIs."
  type = list(string)
}

variable "node_group_instance_type" {
  type    = string
  default = "t3.small"
}

variable "node_group_desired_size" {
  type    = number
  default = 2
}

variable "node_group_min_size" {
  type    = number
  default = 1
}

variable "node_group_max_size" {
  type    = number
  default = 3
}