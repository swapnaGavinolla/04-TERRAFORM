module "ec2" {
  source = "../05-ec2_module"
  ami = data.aws_ami.ami_id.id
  instance_type = "t2.micro"
}