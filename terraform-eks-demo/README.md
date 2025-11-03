This repo provisions a minimal dev EKS environment with:
- VPC (public + private subnets)
- EKS cluster (managed node group)
- ECR repositories: frontend, backend
- Jenkins EC2 instance with an instance profile that can push to ECR and call EKS

Structure:
envs/dev/         - example environment (main.tf, variables.tf, terraform.tfvars)

modules/
  vpc/            - wrapper around terraform-aws-modules/vpc/aws
  eks/            - wrapper around terraform-aws-modules/eks/aws
  ecr/            - simple ECR module
  jenkins_ec2/    - EC2 + SG + IAM role for Jenkins

providers.tf      - root provider