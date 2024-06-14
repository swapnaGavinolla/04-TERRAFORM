module "ec2_instance" {
  for_each = var.instance_names
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops-ami.id
  instance_type = each.value
  vpc_security_group_ids = [local.security_group_id]
  subnet_id = each.key == "web" ? local.public_subnet_ids[0] : local.private_subnet_ids[0]

  tags = merge(
    {
        Name = each.key
    },
    var.common_tags
  )
  
}

module "ec2_ansible" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops-ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [local.security_group_id]
  subnet_id = local.public_subnet_ids[0]
  user_data = file("roboshop-ansible.sh")

  tags = merge(
    {
        Name = "Ansible"
    },
    var.common_tags
  )
  
}