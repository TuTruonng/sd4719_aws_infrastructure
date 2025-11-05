variable "name" {
  type    = string
  default = "jenkins-server"
}

variable "subnet_id" {
  type = string
}

variable "ssh_key_name" {
  type = string
}

variable "jenkins_ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}