module "aws_vpc_demo" {
  source = "git::https://github.com/amantur/terraform-modules.git//aws/aws_vpc"

  cidr_block = var.vpc_cidr_block

  tags = var.tags
}

module "aws_subnet_demo" {
  source = "git::https://github.com/amantur/terraform-modules.git//aws/aws_subnet"

  for_each = { for s in var.subnets : s.type => s }

  vpc_id            = module.aws_vpc_demo.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = each.value.tags
}
