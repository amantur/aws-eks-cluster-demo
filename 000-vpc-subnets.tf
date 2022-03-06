module "aws_vpc_demo" {
  source = "https://github.com/amantur/terraform-modules/aws/eks_vpc"

  cidr_block = var.vpc_cidr_block

  tags = var.tags
}

moudle "aws_subnet_demo" {
  source = "https://github.com/amantur/terraform-modules/aws/eks_subnet"

  vpc_id     = module.aws_vpc_demo.id
  cidr_block = var.subnet_cidr_block
  tags       = var.tags
}
