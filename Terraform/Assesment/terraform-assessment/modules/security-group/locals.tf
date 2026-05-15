locals {

  security_group_name = join("-", [
    "security-group",
    lower(var.project_name),
    lower(var.environment),
    "001"
  ])

}