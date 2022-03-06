module "aws_eks_cluster_demo" {
  source = "https://github.com/amantur/terraform-modules/aws/aws_eks_cluster"

  name     = var.cluster_name
  role_arn = module.aws_iam_role_demo.arn

  vpc_config {
    # Configure vpc and network settings 
    security_group_ids = ["${module.aws_security_group_demo.id}"]
    subnet_ids         = ["subnet-1312586", "subnet-8126352"]
  }

  depends_on = [module.aws_iam_role_policy_attachment_demo]
}

