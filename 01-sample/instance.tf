resource "aws_instance" "my-1st-ec2" {
  count= length(var.instance_names)  
  ami           = data.aws_ami.ami_id.id
  instance_type = local.instance_type
  security_groups = [aws_security_group.allow_all.name]
  
  tags = {
    Name = var.instance_names[count.index]
  }
}

resource "aws_route53_record" "route53" {
  count = length(var.instance_names)
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.my-1st-ec2[count.index].private_ip]
}


resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all traffic"
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = var.sg_tags
}