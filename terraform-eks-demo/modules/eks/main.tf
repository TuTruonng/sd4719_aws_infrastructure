module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = ">= 20.0.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.26"

  # Use provided VPC/subnets
  vpc_id     = var.vpc_id
  subnets    = var.private_subnets

  node_groups = {
    default = {
      desired_capacity = var.node_group_desired_capacity
      max_capacity     = var.node_group_desired_capacity
      min_capacity     = 0
      instance_types   = [var.node_group_instance_type]
    }
  }

  manage_aws_auth = true

  tags = {
    Terraform = "true"
    Name      = var.cluster_name
  }
}