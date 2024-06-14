module "sg" {
  source = "../14-sg_module"
  sg_name = "allow_all"
  sg_description = "allow all"
  ingress = var.ingress
  project_name = var.project_name
  env = var.env
  vpc_id = local.vpc_id
  
}