module "network_module" {
  
  source = "E:\\ITI\\terraformPractice\\terra-pro\\network"
  
    vpc_name = var.vpc_name
    vpc_ip = var.vpc_ip
    AZ = var.AZ
    public_subnets_cidr = var.public_subnets_cidr
    private_subnets_cidr = var.private_subnets_cidr
    public_subnet_tags = var.public_subnet_tags
    private_subnet_tags = var.private_subnet_tags
}

module "instance_module" {
    source = "E:\\ITI\\terraformPractice\\terra-pro\\instances"

    AZ = var.AZ
    ami = var.ami
    public_ec2_tags = var.public_ec2_tags
    private_ec2_tags = var.private_ec2_tags
    lb_name = var.lb_name
    lb_type = var.lb_type
    vpc_id = module.network_module.vpc_id
    public_subnets_id = module.network_module.public_subnet_id
    private_subnets_id = module.network_module.private_subnet_id
    public_SG_EC2s = module.network_module.public_SG_EC2
    private_SG_EC2s = module.network_module.private_SG_EC2

}


module "DB_RDS" {
    source = "E:\\ITI\\terraformPractice\\terra-pro\\DB" 
    DB_SG = module.network_module.DB_SG
    subnet_ids = module.network_module.private_subnet_id
  
}