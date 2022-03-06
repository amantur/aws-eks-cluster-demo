iam_role_name = "eks_demo_iam_role"

assume_role_policy = {
  Version = "2012-10-17",
  Statement = [
    {
      Effect = "Allow",
      Principal = {
        Service = "eks.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }
  ]
}

sg_name        = "sg_eks_cluster_demo"
sg_description = "EKS Cluster demo ingress security group."
sg_vpc_id      = null



tags = { "provisioner" = "terraform", "use" = "eks_demo" }
