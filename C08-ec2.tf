module "ec2_private" {
  depends_on             = [module.vpc]
  count                  = var.private_instance_count
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "3.5.0"
  name                   = "${local.name}-ec2-${count.index}"
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [module.private-sg.security_group_id]
  #iam_instance_profile   = var.ec2_iam_role
  iam_instance_profile = aws_iam_instance_profile.ec2-ins-prof-ssm.id
  subnet_id            = module.vpc.database_subnets["${count.index}"]

  #instance_count = var.private_instance_count
  user_data = file("${path.module}/user-data.sh")
  tags = merge(
    local.common_tags,
    {
      type = "EC2"
    }
  )

}

module "ec2_private_win" {
  depends_on             = [module.vpc]
  count                  = var.private_instance_count
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "3.5.0"
  name                   = "${local.name}-ec2-win-${count.index}"
  ami                    = data.aws_ami.winami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [module.private-sg.security_group_id]
  iam_instance_profile   = aws_iam_instance_profile.ec2-ins-prof-ssm.id
  subnet_id              = module.vpc.database_subnets[1]
  key_name               = aws_key_pair.this.key_name

  tags = merge(
    local.common_tags,
    {
      type = "EC2-Win"
    }
  )

}
