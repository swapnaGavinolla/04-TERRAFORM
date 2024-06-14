module "records" {
    for_each = local.ips
  source  = "terraform-aws-modules/route53/aws//modules/records"
  zone_name = var.zone_name
  records = [
    {
      name    = each.key
      type    = "A"
      ttl     = 3600
      records = [
         each.key == "web" ? each.value.public_ip : each.value.private_ip
      ]
    }
  ]
}