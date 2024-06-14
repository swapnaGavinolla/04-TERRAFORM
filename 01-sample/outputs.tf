output "public_ip" {
  value = aws_instance.my-1st-ec2[*].public_ip
}

output "sg_id" {
  value = aws_security_group.allow_all.id
}