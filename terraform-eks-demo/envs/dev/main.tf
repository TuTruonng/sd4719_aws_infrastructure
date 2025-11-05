# Use the root provider (providers.tf)
locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 2)
}

data "aws_availability_zones" "available" {}

# VPC module
module "vpc" {
  source = "../../modules/vpc"

  name            = "sd4719-eks-vpc"
  cidr            = "10.0.0.0/16"
  azs             = local.azs
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.10.0/24", "10.0.11.0/24"]
}

# ECR repos
module "ecr" {
  source = "../../modules/ecr"

  repositories = ["frontend", "backend"]
}

# EKS cluster
module "eks" {
  source = "../../modules/eks"

  cluster_name                = var.cluster_name
  vpc_id                      = module.vpc.vpc_id
  private_subnets             = module.vpc.private_subnets
  node_group_instance_type    = var.node_group_instance_type
  node_group_desired_capacity = var.node_group_desired_capacity
}

# Jenkins EC2 - put Jenkins into the first public subnet
module "jenkins" {
  source = "../../modules/jenkins-ec2"

  name           = "sd4719-jenkins"
  subnet_id      = element(module.vpc.public_subnets, 0)
  ssh_key_name   = var.ssh_key_name
  jenkins_ami_id = var.jenkins_ami_id
  instance_type  = var.jenkins_instance_type
}