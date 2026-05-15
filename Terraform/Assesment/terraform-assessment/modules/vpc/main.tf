resource "aws_vpc" "my_vpc" {

  for_each = var.vpc_cidr

  cidr_block = each.value

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.common_tags,
    {
      Name = local.vpc_names[each.key]
    }
  )

  lifecycle {
    prevent_destroy = false
  }

}