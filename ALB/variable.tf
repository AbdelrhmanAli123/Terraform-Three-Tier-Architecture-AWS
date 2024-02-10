
variable "vpc_id" {
  type = string
}
variable "ami" {
 
    type = string
  
}

variable "lb_name" {
  type = string  
}

variable "lb_type" {
  type = string  
}

variable "AZ" {
  type    = list(string)
}


variable "public_subnets_id" {
  type = list(string)
}
variable "private_subnets_id" {
  type = list(string)
}

variable "ALB_SG" {
  type = string
}

