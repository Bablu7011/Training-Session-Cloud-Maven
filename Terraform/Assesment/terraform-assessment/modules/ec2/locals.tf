locals {

  instance_name = join("-", [
    "ec2",
    lower(var.project_name),
    lower(var.environment),
    "001"
  ])

}