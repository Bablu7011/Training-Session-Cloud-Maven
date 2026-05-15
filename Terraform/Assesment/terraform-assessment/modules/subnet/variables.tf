variable "subnet_cidrs" {
  description = "Subnet CIDR blocks"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "common_tags" {
  type = map(string)
}