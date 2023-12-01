variable "public_ec2_tags" {

    type = list(string)
  
}

variable "ami" {
 
    type = string
  
}

variable "public_ec2_tags" {

    type = list(string)  
}

variable "private_ec2_tags" {
    type = list(any)  
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


variable "public_subnets_cidr" {
  type    = list(string)
}
