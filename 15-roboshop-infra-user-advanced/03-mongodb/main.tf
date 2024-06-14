module "mongodb_sg" {
  source = "../../14-sg_module"
  sg_name = "allow_all"
  sg_description = "allow all"
  project_name = var.project_name
  env = var.env
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  
}

resource "aws_security_group_rule" "mongodb_sg" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  source_security_group_id = data.aws_ssm_parameter.vpc_sg_id.value
  security_group_id = module.mongodb_sg.security_group_id
}

module "mongodb" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops-ami.id
  instance_type = "t2.micro"
  subnet_id = element(split(",", data.aws_ssm_parameter.database_subnet_ids), 0)
  vpc_security_group_ids = [module.mongodb_sg.security_group_id]
  #user_data = file("mongodb.sh")
  tags = merge(
    {
        Name = "vpn"
    },
    var.common_tags
  )
  
}