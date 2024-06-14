locals {
 intance_type =  var.instance_names == "mongodb" ? "t3.medium" : "t2.micro"
}