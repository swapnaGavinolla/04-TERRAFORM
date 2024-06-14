resource "aws_ssm_parameter" "vpc_sg_id" {
  name = "/${var.project_name}/${var.env}/vpc_sg_id"
  type = "String"
  value = local.security_group_id
}