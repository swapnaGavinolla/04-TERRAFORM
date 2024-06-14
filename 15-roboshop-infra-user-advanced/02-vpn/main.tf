module "vpn_sg" {
  source = "../../14-sg_module"
  sg_name = "allow_all"
  sg_description = "allow all"
  project_name = var.project_name
  env = var.env
  vpc_id = data.aws_vpc.default.id
  
}

resource "aws_security_group_rule" "vpn_sg" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  security_group_id = module.vpn_sg.security_group_id
}

module "vpn" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops-ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [module.vpn_sg.security_group_id]

  tags = merge(
    {
        Name = "vpn"
    },
    var.common_tags
  )
  
}