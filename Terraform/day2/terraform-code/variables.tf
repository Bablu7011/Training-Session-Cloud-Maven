# variable "vpc_name" {
#   type = string
#   #default     = "my_vpc"
#   description = "New Vpc name"
# }

# variable "subnet_name" {
#   type = string
#   #default     = "public_subnet"
#   description = "new subnet name"
# }

# variable "new_igw" {
#   type = string
#   #default     = "first_igw"
#   description = "new igw name"
# }


# variable "az_name" {
#   type = string
#   #default     = "us-east-1a"

#   description = "availability zone name"
# }

# variable "instance_names" {
#   type = list(string)

#   #default = ["dev-server", "test-server", "prod-server"]
# }

# variable "instance_count" {
#   type = number
#   #default     = 1
#   description = "number of EC2 instances to create"
  
# }

# variable "map_ip" {
#   type        = bool
#   #default     = true
#   description = "map public ip on launch"
# }


# locals {
#   prefix = "myapp"
#   env = "dev"
#   project = "terraform-project"
# }


variable "instance_type" {
    type  = string
    default = "t2.micro"
    description = "this  is ec2 vm instance type"
    sensitive = true
}