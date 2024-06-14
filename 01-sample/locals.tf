locals {
  instance_type = var.instance_names == "mogodb" ? "t3.medium" : "t2.micro"
}