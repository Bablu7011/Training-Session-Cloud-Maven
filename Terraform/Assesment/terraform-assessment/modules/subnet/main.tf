resource "aws_subnet" "my_subnet" {

  for_each = var.subnet_cidrs

  vpc_id = var.vpc_id

  cidr_block = each.value.cidr

  availability_zone = each.value.az

  map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    {
      Name = local.subnet_names[each.key]
    }
  )

  lifecycle {
    ignore_changes = [map_public_ip_on_launch]
  }

}