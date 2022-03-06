variable "vpc_cidr_block" {
  type        = string
  description = "The IPv4 CIDR block for VPC."
}

variable "subnet_cidr_block" {
  type        = string
  description = "The IPv4 CIDR block for VPC."
}

variable "iam_role_name" {
  type        = string
  description = "Role Name"
}

variable "assume_role_policy" {
  type = object({
    Version = string
    Statement = list(
      object({
        Action = string
        Effect = string
        Sid    = string
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

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnet_ids" {
  type        = list(any)
  description = "List of subnet IDs. Must be in at least two different availability zones."
}

variable "tags" {
  type = map(string)
}
