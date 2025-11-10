variable "name" {
  type    = string
  default = "jenkins-server"
}

variable "subnet_id" {
  type = string
}

variable "ssh_key_name" {
  description = "SSH key pair name"
  type = string
}

variable "jenkins_ami_id" {
  description = "AMI ID for Jenkins EC2"
  type = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type    = string
  default = "t3.micro"
}