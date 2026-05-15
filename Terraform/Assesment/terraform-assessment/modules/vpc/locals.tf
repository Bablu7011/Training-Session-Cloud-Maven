locals {

  vpc_names = {
    for key, value in var.vpc_cidr :
    key => "vpc-${var.project_name}-${var.environment}-001"
  }

}