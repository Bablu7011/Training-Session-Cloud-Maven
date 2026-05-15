resource "aws_security_group" "my_sg" {

  count = var.security_group_count

  name        = "${local.security_group_name}-${count.index + 1}"
  description = "Security group for EC2"
  vpc_id      = var.vpc_id

  dynamic "ingress" {

    for_each = var.ingress_rules

    content {

      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

      description = ingress.value.description

    }

  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = merge(
    var.common_tags,
    {
      Name         = "${local.security_group_name}-${count.index + 1}"
      ResourceType = upper("security-group")
    }
  )

  lifecycle {
    create_before_destroy = true
  }

}