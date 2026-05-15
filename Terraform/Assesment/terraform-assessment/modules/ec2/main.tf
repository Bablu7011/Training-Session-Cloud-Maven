resource "aws_instance" "this" {

  count = var.instance_count

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.subnet_id

  vpc_security_group_ids = var.security_group_ids

  associate_public_ip_address = true

  tags = merge(
    var.common_tags,
    {
      Name = "${local.instance_name}-${count.index + 1}"
      ResourceType = upper("ec2")
    }
  )

  lifecycle {
    create_before_destroy = true
  }

}