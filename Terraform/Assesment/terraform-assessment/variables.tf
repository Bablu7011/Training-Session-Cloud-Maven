variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "managed_by" {
  description = "Managed by tag"
  type        = string
}

variable "enable_vpc" {
  description = "Enable VPC creation"
  type        = bool
  default     = true
}

variable "enable_subnet" {
  description = "Enable Subnet creation"
  type        = bool
  default     = true
}

variable "enable_security_group" {
  description = "Enable Security Group creation"
  type        = bool
  default     = true
}

variable "enable_ec2" {
  description = "Enable EC2 instance creation"
  type        = bool
  default     = true
}