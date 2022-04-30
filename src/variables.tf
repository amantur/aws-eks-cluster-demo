variable "vpc_cidr_block" {
  type        = string
  description = "cidr block for VPC addresses."
}

variable "subnets" {
  type = list(object({
    type              = string
    cidr_block        = string,
    availability_zone = string,
    tags              = map(string)
  }))

  description = <<SNET
  Defines values requried to define subnets. There must be two availability zones. e.g.;
  [
    {
      type = "public-1",
      cidr_block = "10.0.1.0/24",
      availability_zone = "ap-southeast-2a",
      tags = {"mytag-1", "tag-value"}
    },
    {
      type = "private-1",
      cidr_block = "10.0.2.0/24",
      availability_zone = "ap-southeast-2b",
      tags = {"mytag-1", "tag-value"}
    }
  ]
  SNET
}

#CLUSTER ROLE
variable "iam_role_name" {
  type        = string
  description = "Role Name"
}

variable "assume_policy_role" {
  type = object({
    Version = string
    Statement = list(
      object({
        Action = string
        Effect = string
        Principal = object({
          Service = string
        })
      })
    ),
  })
}

#SECURITY GROUP
variable "sg_name" {
  type        = string
  description = "Security Group Name"
}

variable "sg_description" {
  type        = string
  description = "Security Group Description"
}

#CLUSTER
variable "cluster_name" {
  type        = string
  description = "Name of the cluster"
}

#NODE GROUP
variable "iam_role_name_node_group" {
  type        = string
  description = "Name of the role created to associate with CNI, Node and ECR policies."
}

variable "node_group_policy_role" {
  type = object({
    Version = string
    Statement = list(
      object({
        Action = string
        Effect = string
        Principal = object({
          Service = string
        })
      })
    ),
  })
}

variable "node_group_name" {
  type        = string
  description = "Name of the EKS Node Group. If omitted, Terraform will assign a random, unique name."
}

variable "node_disk_size" {
  type        = number
  description = " Disk size in GiB for worker nodes. Defaults to 20."
  default     = 20
}

variable "k8s_node_sizes" {
  type        = list(string)
  description = "List of instance types associated with the EKS Node Group. Defaults to ['t3.micro']."
  default     = ["t3.micro"]
}

#SHARED
variable "tags" {
  type = map(string)
}
