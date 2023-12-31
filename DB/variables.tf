variable "private_subnets_cidr" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]

}

variable "DB_SG" {
  type = string
  
}

variable "subnet_ids" {
  type = list(string)
  
}