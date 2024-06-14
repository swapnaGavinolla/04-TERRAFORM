module "vpc" {
  source = "../08-vpc_module"
  vpc_cidr_block= var.vpc_cidr_block
  public_subnet_cidr_block = var.public_subnet_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
  database_subnet_cidr_block = var.database_subnet_cidr_block
  public_route_table_cidr_block = var.public_route_table_cidr_block
  vpc_tags = var.vpc_tags
  common_tags = var.common_tags
  igw_tags = var.igw_tags
  public_subnet_tags = var.public_subnet_tags
  private_subnet_tags = var.private_subnet_tags
  database_subnet_tags = var.database_subnet_tags
  public_route_table_tags = var.public_route_table_tags
  private_route_table_tags = var.private_route_table_tags
  database_route_table_tags = var.database_route_table_tags
}


