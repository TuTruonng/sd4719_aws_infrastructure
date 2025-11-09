module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.cluster_name
  kubernetes_version = "1.33"

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  # Use provided VPC/subnets
  vpc_id                    = var.vpc_id
  subnet_ids                = var.worker_nodes_private_subnets
  control_plane_subnet_ids  = var.control_plane_private_subnets

  eks_managed_node_groups = {
    dev-spot = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types   = [var.node_group_instance_type]
      capacity_type  = "SPOT"
      disk_size      = 20

      min_size     = 0
      max_size     = var.node_group_desired_size
      desired_size = var.node_group_desired_size
    }
  }

  tags = {
    Environment = "dev"
    Terraform = "true"
  }
}