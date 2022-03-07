module "aws_security_group_demo" {
  source = "git::https://github.com/amantur/terraform-modules.git//aws/aws_security_group"

  name        = var.sg_name
  description = var.sg_description
  vpc_id      = module.aws_vpc_demo.id

  tags = var.tags
}
