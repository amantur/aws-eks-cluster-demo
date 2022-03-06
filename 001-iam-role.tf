module "aws_iam_role_demo" {
  source = "https://github.com/amantur/terraform-modules/aws/aws_iam_role"

  role_name = var.iam_role_name

  assume_role_policy_object = var.assume_role_policy

  tags = var.tags
}

module "aws_iam_role_policy_attachment_demo" {
  source = "https://github.com/amantur/terraform-modules/aws/aws_iam_role_policy_attachment"

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.aws_iam_role_demo.name
}

