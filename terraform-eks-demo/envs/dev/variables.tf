variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

variable "cluster_name" {
  type    = string
  default = "sd4719-eks-cluster"
}

variable "node_group_instance_type" {
  type    = string
  default = "t3.medium"
}

variable "node_group_desired_capacity" {
  type    = number
  default = 1
}

variable "ssh_key_name" {
  type    = string
  description = "SSH key name existing in AWS to access the Jenkins instance"
  default = ""
}

variable "jenkins_ami_id" {
  type    = string
  description = "AMI id for Jenkins EC2 (Ubuntu 22.04 or Amazon Linux 2). Must be valid in chosen region."
  default = ""
}

variable "jenkins_instance_type" {
  type    = string
  default = "t3.medium"
}