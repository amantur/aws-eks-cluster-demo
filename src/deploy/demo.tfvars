#VPC & SUBNETS
vpc_cidr_block = "192.168.0.0/16"

subnets = [
  {
    type              = "public-1"
    cidr_block        = "192.168.0.0/18",
    availability_zone = "ap-southeast-2a"
  },
  {
    type              = "public-2"
    cidr_block        = "192.168.64.0/18",
    availability_zone = "ap-southeast-2b"
  },
  {
    type              = "private-1"
    cidr_block        = "192.168.128.0/18",
    availability_zone = "ap-southeast-2a"
  },
  {
    type              = "private-2"
    cidr_block        = "192.168.192.0/18",
    availability_zone = "ap-southeast-2b"
  }
]

#IAM
iam_role_name = "eks_demo_iam_role"

assume_policy_role = {
  Version = "2012-10-17",
  Statement = [
    {
      Effect = "Allow",
      Action = "sts:AssumeRole",
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }
  ]
}

#SECURITY GROUP
sg_name        = "sg_eks_cluster_demo"
sg_description = "EKS Cluster demo ingress security group."

#CLUSTER
cluster_name = "eks_demo_cluster"

#SHARED TAGS
tags = { "provisioner" = "terraform", "use" = "eks_demo" }
