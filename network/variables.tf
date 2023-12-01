variable "vpc_name" {
    type = string

}

variable "vpc_ip" {
    type = string

}
variable "AZ" {
  type    = list(string)
  default = [ "value" ]

}

variable "public_subnets_cidr" {
  type    = list(string)

}

variable "public_subnet_tags" {
  type    = list(string)

}

variable "private_subnets_cidr" {
  type    = list(string)
}

variable "private_subnet_tags" {
  type    = list(string)

}
