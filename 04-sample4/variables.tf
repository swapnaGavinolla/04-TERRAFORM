variable "instance_names" {
 default = {
    mongodb = "t3.medium"
    catalogue = "t2.micro"
    user = "t2.micro"
    web = "t2.micro"
    cart = "t2.micro"
}
}

variable "ingress" {

    default = [
     {
      from_port        = 22
      to_port          = 22
      protocol         = "ssh"
      cidr_blocks      = ["0.0.0.0/0"]
    },

    {
      from_port        = 443
      to_port          = 443
      protocol         = "https"
      cidr_blocks      = ["0.0.0.0/0"]
    },

    {
      from_port        = 80
      to_port          = 22
      protocol         = "http"
      cidr_blocks      = ["0.0.0.0/0"]
    } ]

}

variable "egress" {

    default = [ 
    {
      from_port        = 22
      to_port          = 22
      protocol         = "ssh"
      cidr_blocks      = ["0.0.0.0/0"]
    },

    {
      from_port        = 443
      to_port          = 443
      protocol         = "https"
      cidr_blocks      = ["0.0.0.0/0"]
    },

    {
      from_port        = 80
      to_port          = 22
      protocol         = "http"
      cidr_blocks      = ["0.0.0.0/0"]
    } 
    ]

}




variable "zone_id" {
   default = "Z061029932O00U328VUBA"
}

variable "domain_name" {
   default = "sureshvadde.online"
}




