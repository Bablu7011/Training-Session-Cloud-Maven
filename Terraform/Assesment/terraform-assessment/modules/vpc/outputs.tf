output "vpc_ids" {
  value = {
    for key, vpc in aws_vpc.my_vpc :
    key => vpc.id
  }
}

