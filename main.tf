module "network_module" {
  
  source = "E:\\ITI\\terraformPractice\\terra-pro\\network"
  
    // network input
    vpc_name = var.vpc_name
    vpc_ip = var.vpc_ip
    AZ = var.AZ
    public_subnets_cidr = var.public_subnets_cidr
    private_subnets_cidr = var.private_subnets_cidr
    public_subnet_tags = var.public_subnet_tags
    private_subnet_tags = var.private_subnet_tags
}

module "instance_module" {
    
  
}

