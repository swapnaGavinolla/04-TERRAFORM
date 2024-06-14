variable "ami_id" {
  default= "ami-0f3c7d07486cad139"
}

variable "instance_type" {
  default= "t2.micro"
}

variable "ec2_tags" {
  default = {
    Name= "instances creation"
    project= "roboshop"
    env= "dev"
  }
}

variable "sg_tags" {
  default = {
    Name= "allow_all"
    project= "roboshop"
    env= "dev"
  }
}

variable "instance_names" {
    default = ["mongodb", "catalogue", "user", "cart"]

}
 variable "zone_id" {
   default = "Z061029932O00U328VUBA"
 }

 variable "domain_name" {
   default = "sureshvadde.online"
 }