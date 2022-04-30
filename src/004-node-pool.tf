locals {
  node_tags       = merge(tomap({ "kubernetes.io/cluster/${module.aws_eks_cluster_demo.id}" = "owned" }), var.tags)
  node_subnet_ids = [for s in module.aws_subnet_demo : s.id]
}

module "aws_iam_role_node_group_demo" {
  source = "git::https://github.com/amantur/terraform-modules.git//aws/aws_iam_role"

  role_name                 = var.iam_role_name_node_group
  assume_policy_role_object = var.node_group_policy_role

  tags = var.tags
}

module "aws_iam_role_policy_node_demo" {
  source = "git::https://github.com/amantur/terraform-modules.git//aws/aws_iam_role_policy_attachment"

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.aws_iam_role_node_group_demo.name
}

module "aws_iam_role_policy_cni_demo" {
  source = "git::https://github.com/amantur/terraform-modules.git//aws/aws_iam_role_policy_attachment"

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.aws_iam_role_node_group_demo.name
}

module "aws_iam_role_policy_ecr_demo" {
  source = "git::https://github.com/amantur/terraform-modules.git//aws/aws_iam_role_policy_attachment"

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.aws_iam_role_node_group_demo.name
}

module "aws_eks_node_group_demo" {
  source = "git::https://github.com/amantur/terraform-modules.git//aws/aws_eks_node_group"

  cluster_name    = module.aws_eks_cluster_demo.id
  node_group_name = var.node_group_name
  node_role_arn   = module.aws_iam_role_node_group_demo.arn
  subnet_ids      = local.node_subnet_ids
  #module.aws_subnet_demo.subnet_ids
  disk_size            = var.node_disk_size
  kubernetes_node_size = var.k8s_node_sizes
  tags                 = local.node_tags

  depends_on = [module.aws_eks_cluster_demo, module.aws_subnet_demo, module.aws_iam_role_policy_node_demo, module.aws_iam_role_policy_cni_demo, module.aws_iam_role_policy_ecr_demo]
}
