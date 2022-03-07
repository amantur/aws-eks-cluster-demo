module "aws_eks_cluster_demo" {
  source = "git::https://github.com/amantur/terraform-modules.git//aws/aws_eks_cluster"

  cluster_name = var.cluster_name
  arn          = module.aws_iam_role_demo.arn

  subnet_ids = [for s in module.aws_subnet_demo : s.id]

  depends_on = [module.aws_subnet_demo, module.aws_iam_role_policy_attachment_demo]
}
