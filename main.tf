module "network_module" {
  
  source = "./network"
  
    vpc_name = var.vpc_name
    vpc_ip = var.vpc_ip
    AZ = var.AZ
    public_subnets_cidr = var.public_subnets_cidr
    private_subnets_cidr = var.private_subnets_cidr
    public_subnet_tags = var.public_subnet_tags
    private_subnet_tags = var.private_subnet_tags
}

module "ASG" {
    source = "./ASG"

    AZ = var.AZ
    ami = var.ami
    public_ec2_tags = var.public_ec2_tags
    vpc_id = module.network_module.vpc_id
    public_subnets_id = module.network_module.public_subnet_id
    public_SG_EC2s = module.network_module.public_SG_EC2

}
module "ALB" {
  source = "./ALB"
  lb_name = var.lb_name
  lb_type= var.lb_type
  ALB_SG = module.network_module.LB_SG
  public_subnets_id = module.network_module.public_subnet_id

}


module "RDS" {
    source = "./RDS" 
    sg_id          = module.network_module.DB_SG
    rds_info       = var.rds_info
    subnet_ids = module.network_module.private_subnet_id
}   