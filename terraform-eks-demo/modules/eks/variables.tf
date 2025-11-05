variable "cluster_name" {
  type    = string
  default = "demo-eks-cluster"
}

variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "node_group_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "node_group_desired_capacity" {
  type    = number
  default = 1
}