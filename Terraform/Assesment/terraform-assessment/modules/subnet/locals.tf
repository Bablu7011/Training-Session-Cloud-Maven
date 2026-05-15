locals {

  subnet_names = {
    for key, value in var.subnet_cidrs :
    key => join("-", [
      "subnet",
      lower(var.project_name),
      lower(key),
      "001"
    ])
  }

}