#CLUSTER
cluster_name = "eks_demo_cluster"

#VPC & SUBNETS
vpc_cidr_block = "192.168.0.0/16"

subnets = [
  {
    type              = "public-1"
    cidr_block        = "192.168.0.0/18",
    availability_zone = "ap-southeast-2a",
    tags = {
      "kubernetes.io/cluster/eks_demo_cluster" = "shared"
      "kubernetes.io/role/elb"                 = "1"
    }
  },
  {
    type              = "public-2"
    cidr_block        = "192.168.64.0/18",
    availability_zone = "ap-southeast-2b",
    tags = {
      "kubernetes.io/cluster/eks_demo_cluster" = "shared"
      "kubernetes.io/role/elb"                 = "1"
    }
  },
  {
    type              = "private-1"
    cidr_block        = "192.168.128.0/18",
    availability_zone = "ap-southeast-2a",
    tags = {
      "kubernetes.io/cluster/eks_demo_cluster" = "shared"
      "kubernetes.io/role/internal-elb"        = "1"
    }
  },
  {
    type              = "private-2"
    cidr_block        = "192.168.192.0/18",
    availability_zone = "ap-southeast-2b",
    tags = {
      "kubernetes.io/cluster/eks_demo_cluster" = "shared"
      "kubernetes.io/role/internal-elb"        = "1"
    }
  }
]

#IAM
iam_role_name = "eks_demo_iam_role"

assume_policy_role = {
  Version = "2012-10-17",
  Statement = [
    {
      Effect = "Allow",
      Principal = {
        Service = "eks.amazonaws.com"
      },
      Action = "sts:AssumeRole",
      Condition = {
        ArnLike = {
          "aws:SourceArn": "arn:aws:eks:ap-southeast-2:id:cluster/eks_demo_cluster"
        }
      }
    }
  ]
}

#SECURITY GROUP
sg_name        = "sg_eks_cluster_demo"
sg_description = "EKS Cluster demo ingress security group."

#NODE GROUP
iam_role_name_node_group = "eks_demo_node_group_role"

node_group_policy_role = {
  Version = "2012-10-17",
  Statement = [
    {
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole",
      Condition = {
        ArnLike = {
          "aws:SourceArn": "arn:aws:eks:region:445601544077:cluster/eks_demo_cluster"
        }
      }
    }
  ]
}

# cni_policy_role = {
#   Version = "2012-10-17",
#   Statement = [
#     {
#       Effect = "Allow",
#       Action = [
#         "ec2:AssignPrivateIpAddresses",
#         "ec2:AttachNetworkInterface",
#         "ec2:CreateNetworkInterface",
#         "ec2:DeleteNetworkInterface",
#         "ec2:DescribeInstances",
#         "ec2:DescribeTags",
#         "ec2:DescribeNetworkInterfaces",
#         "ec2:DescribeInstanceTypes",
#         "ec2:DetachNetworkInterface",
#         "ec2:ModifyNetworkInterfaceAttribute",
#         "ec2:UnassignPrivateIpAddresses"
#       ],
#       Resource = "*"
#     },
#     {
#       Effect   = "Allow",
#       Action   = ["ec2:CreateTags"],
#       Resource = ["arn:aws:ec2:*:*:network-interface/*"]
#     }
#   ]
# }

node_group_name = "eks_demo_node_group"
node_disk_size  = 20
k8s_node_sizes  = ["t2.micro"]

#SHARED TAGS
tags = { "provisioner" = "terraform", "purpose" = "eks_demo" }
