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

variable "security_group_count" {
  type = number
}

variable "ingress_rules" {

  type = list(object({
    port        = number
    description = string
  }))

}