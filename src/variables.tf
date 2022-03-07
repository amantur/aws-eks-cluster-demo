variable "vpc_cidr_block" {
  type        = string
  description = "cidr block for VPC addresses."
}

variable "subnets" {
  type = list(object({
    type              = string
    cidr_block        = string,
    availability_zone = string
  }))

  description = <<SNET
  Defines values requried to define subnets. There must be two availability zones. e.g.;
  [
    {
      type = "public-1",
      cidr_block = "10.0.1.0/24",
      availability_zone = "ap-southeast-2a"
    },
    {
      type = "private-1",
      cidr_block = "10.0.2.0/24",
      availability_zone = "ap-southeast-2b"
    }
  ]
  SNET
}

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

variable "sg_name" {
  type        = string
  description = "Security Group Name"
}

variable "sg_description" {
  type        = string
  description = "Security Group Description"
}

variable "cluster_name" {
  type        = string
  description = "Name of the cluster"
}

variable "tags" {
  type = map(string)
}
