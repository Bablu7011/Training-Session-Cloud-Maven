output "subnet_ids" {

  value = {
    for key, subnet in aws_subnet.my_subnet :
    key => subnet.id
  }

}