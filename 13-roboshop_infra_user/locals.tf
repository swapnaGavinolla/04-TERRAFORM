locals {
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  database_subnet_ids = module.vpc.database_subnet_ids
  security_group_id = module.sg.security_group_id
  ips = module.ec2_instance
}

