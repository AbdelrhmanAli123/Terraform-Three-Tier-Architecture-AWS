variable "region" {
    type = string
}


variable "vpc_name" {
    type = string

}

variable "vpc_ip" {
    type = string

}
variable "AZ" {
  type    = list(string)

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

variable "RDS_subnets_id" {
  type = list(string)
}


variable "sg_id" {
  type = string
}

variable "RDS_subnets_id" {
  type = list(string)
}


variable "sg_id" {
  type = string
}

variable "rds_info" {
  type = object({
    allocated_storage         = number
    db_name                   = string
    engine                    = string
    engine_version            = string
    instance_class            = string
    username                  = string
    password                  = string
    subnet-group-name         = string
    backup_retention_period   = number
    skip_final_snapshot       = bool
    # final_snapshot_identifier = string
    tag                       = string
  })
}