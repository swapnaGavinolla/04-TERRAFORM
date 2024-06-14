variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  default = ["10.0.1.0/24" , "10.0.2.0/24"]
}

variable "private_subnet_cidr_block" {
  default = ["10.0.3.0/24" , "10.0.4.0/24"]
}

variable "database_subnet_cidr_block" {
  default = ["10.0.5.0/24" , "10.0.5.0/24"]
}

variable "public_route_table_cidr_block" {
  default = "0.0.0.0/0"
}

variable "vpc_tags" {
  default = {
    Name = "vpc"
  }
}

variable "common_tags" {
   default = {
    Project_Name = "roboshop"
    Env          = "Dev"
    terraform    = true
   }
}

variable "igw_tags" {
  default = {
    Name = "igw"
  }
}

variable "public_subnet_tags" {
    default = {
    Name = "public"
  } 
}

variable "private_subnet_tags" {
  default = {
    Name = "private"
  }
}

variable "database_subnet_tags" {
  default = {
    Name = "database"
  }
}

variable "public_route_table_tags" {
  default = {
    Name = "public"
  }
}

variable "private_route_table_tags" {
   default = {
    Name = "private"
  }
}

variable "database_route_table_tags" {
   default = {
    Name = "database"
  }
}
