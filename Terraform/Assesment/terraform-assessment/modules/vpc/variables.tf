variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = map(string)
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