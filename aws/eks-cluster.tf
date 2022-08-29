module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.28.0"

  cluster_name    = local.cluster_name
  cluster_version = "1.23"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

    attach_cluster_primary_security_group = true

    # Disabling and using externally provided security groups
    create_security_group = false
  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-${random_string.suffix.result}-1"

      instance_types = ["t2.micro"]

      min_size     = 4
      max_size     = 10
      desired_size = 6

      pre_bootstrap_user_data = <<-EOT
      echo 'eks-node-group-1'
      EOT

      vpc_security_group_ids = [
        aws_security_group.security_group_one.id
      ]
    }

    two = {
      name = "node-group-${random_string.suffix.result}-2"

      instance_types = ["t2.micro"]

      min_size     = 4
      max_size     = 10
      desired_size = 6

      pre_bootstrap_user_data = <<-EOT
      echo 'eks-node-group-2'
      EOT

      vpc_security_group_ids = [
        aws_security_group.security_group_two.id
      ]
    }
  }
}
