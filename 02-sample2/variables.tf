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
    default = {
      mongodb = "t3.medium"
      catalogue = "t2.micro"
      user = "t2.micro"
      cart = "t2.micro"
      redis ="t2.micro" 

    }

}
 variable "zone_id" {
   default = "Z061029932O00U328VUBA"
 }

 variable "domain_name" {
   default = "sureshvadde.online"
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
    to_port          = 80
    protocol         = "http"
    cidr_blocks      = ["0.0.0.0/0"]
  } 
   ]
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
    to_port          = 80
    protocol         = "http"
    cidr_blocks      = ["0.0.0.0/0"]
  } 
   ]
 }