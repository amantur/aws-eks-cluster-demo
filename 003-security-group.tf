module "aws_security_group_demo" {
  source = "https://github.com/amantur/terraform-modules/aws/aws_security_group"

  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.sg_vpc_id

}
