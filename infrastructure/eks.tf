module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "test-cluster"
  cluster_version = "1.31"

  # Optional
  cluster_endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    general-purpose = {
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 3
      desired_size   = 2
    }

    high-memory = {
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 2
      desired_size   = 1

      labels = {
        node-type = "high-mem"
      }
    }
  }

  vpc_id     = aws_vpc.main.id
  subnet_ids = aws_subnet.public_subnet[*].id

  tags = {
    Environment = "dev"
    Terraform   = "true"

  }
}
