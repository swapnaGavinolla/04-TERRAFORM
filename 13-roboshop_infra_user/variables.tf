variable "project_name" {
  default = "roboshop"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "common_tags" {
  default = {
    Project = "roboshop"
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "public_subnet_cidr" {
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_subnet_cidr" {
  default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "database_subnet_cidr" {
  default = ["10.0.21.0/24","10.0.22.0/24"]
}

variable "env" {
  default = "dev"

}

variable "ingress" {
    default = [
    {
        from_port = 0
        to_port = 0
        description = "allow all"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "instance_names" {
    default = {
      web ="t2.micro"
      mongodb = "t3.medium"
      catalogue = "t2.micro"
      user = "t2.micro"
      cart = "t2.micro"
      redis ="t2.micro" 
      mysql = "t3.medium"
      shipping = "t2.micro"
      rabbitmq = "t2.micro"
      payment = "t2.micro"
    }

}

variable "zone_name" {
  default = "sureshvadde.online"
}