
variable "env" {
  default = "dev"

}

variable "common_tags" {
  default = {
    Project = "roboshop"
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "project_name" {
  default = "roboshop"
}