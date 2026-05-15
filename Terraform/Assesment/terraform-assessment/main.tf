module "vpc" {
  count  = var.enable_vpc ? 1 : 0
  source = "./modules/vpc"

  vpc_cidr = {
    main = "10.0.0.0/16"

  }

  project_name = var.project_name
  environment  = var.environment
  common_tags  = local.common_tags

}



module "subnet" {
  count  = var.enable_subnet ? 1 : 0
  source = "./modules/subnet"

  vpc_id = module.vpc[0].vpc_ids["main"]

  subnet_cidrs = {

    public = {
      cidr = "10.0.1.0/24"
      az   = "ap-south-1a"
    }

    private = {
      cidr = "10.0.2.0/24"
      az   = "ap-south-1b"
    }

  }

  project_name = var.project_name
  environment  = var.environment
  common_tags  = local.common_tags

}



module "security_group" {
  count  = var.enable_security_group ? 1 : 0
  source = "./modules/security-group"

  vpc_id = module.vpc[0].vpc_ids["main"]

  security_group_count = 1

  ingress_rules = [

    {
      port        = 22
      description = "SSH"
    },

    {
      port        = 80
      description = "HTTP"
    },

    {
      port        = 443
      description = "HTTPS"
    }

  ]

  project_name = var.project_name
  environment  = var.environment
  common_tags  = local.common_tags

}



module "ec2" {
  count  = var.enable_ec2 ? 1 : 0
  source = "./modules/ec2"

  ami_id        = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"

  subnet_id = module.subnet[0].subnet_ids["public"]

  security_group_ids = module.security_group[0].security_group_ids

  instance_count = 1

  project_name = var.project_name
  environment  = var.environment
  common_tags  = local.common_tags

}


module "s3" {

  source = "./modules/s3"

  bucket_count = 1

  project_name = var.project_name
  environment  = var.environment
  common_tags  = local.common_tags

}