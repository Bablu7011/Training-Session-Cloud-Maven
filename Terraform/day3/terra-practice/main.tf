## lab1

# variable "s3_bucket_name" {
#     type= list(string)
#     default =["storage0-42343", "storage1-42343", "storage2-42343"]

# }

# resource "aws_s3_bucket" "my_bucket" {
#     count=length(var.s3_bucket_name)
#     bucket= var.s3_bucket_name[count.index]
# }



## Lab2 
# variable "ec2_names" {
#   type = map(string)
#   default = {
#     dev  = "dev-server"
#     prod = "prod-server"
#   }
# }

# variable "instance_types" {
#   type = object({
#     instance_type = string
#     count         = number
#   })

#   default = {
#     instance_type = "t2.micro"
#     count         = 1
#   }
# }


# resource "aws_instance" "my_instance" {
#   instance_type = var.instance_types.instance_type
#   count         = var.instance_types.count
#   ami           = "ami-01b40e1bcccae197a"

#   tags = {
#     Name = "${var.ec2_names["dev"]}-${count.index}"

#   }

# }


# ##  lab 3: Simplyfing count for resources
# variable "environment" {
#     type = string
#     default = "dev"
# }


# locals{
#     ec2_count = var.environment == "dev"? 1:0
# }


# resource "aws_instance" "my_server" {
#     ami  = "ami-01b40e1bcccae197a"
#     instance_type = "t2.micro"
#     count = local.ec2_count

#     tags = {
#         Name = "web-server"
#     }
# }


# ## lab 4
# variable "enable_new" {
#   type    = bool
#   default = true
# }

# locals {
#   final_server = var.enable_new ? ["dev-server", "prod-server", "test-server"] : ["dev-server", "prod-server"]

# }


# resource "aws_instance" "web-server" {
#   instance_type = "t2.micro"
#   ami           = "ami-01b40e1bcccae197a"
#   for_each      = toset(local.final_server)

#   tags = {
#     Name = each.key
#   }
# }


# ## lab 5

# variable "ports" {
#   type    = list(number)
#   default = [22, 80, 443]
# }



# resource "aws_security_group" "my_sg" {
#   name = "my-sg"

#   dynamic "ingress" {
#     for_each = var.ports
#     content {
#       from_port   = ingress.value
#       to_port     = ingress.value
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }
# }



# ## lab 6

# variable "ports" {
#   type    = list(number)
#   default = [22, 80, 443]
# }



# resource "aws_security_group" "my_sg" {
#     count=2
#   name = "my-sg-${count.index+1}"

#   dynamic "ingress" {
#     for_each = var.ports
#     content {
#       from_port   = ingress.value
#       to_port     = ingress.value
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }
# }



# ## lab 7



# resource "aws_security_group" "my_sg" {
#   name = "my-sg"

#     ingress {
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }



# resource "aws_instance" "my_server" {
#     ami  = "ami-01b40e1bcccae197a"
#     instance_type = "t3.micro"
#     depends_on = [ aws_security_group.my_sg ]

#     tags = {
#         Name = "web-server"
#     }


#     # lifecycle {
#     #   create_before_destroy = true
#     # }

#     # lifecycle {
#     #   prevent_destroy = true
#     # }
    
#     # lifecycle {
#     #   ignore_changes = [ tags ]
#     # }
# }



## Lab 8

variable "ports" {

  type = list(number)

  default = [22, 80, 443]

}

resource "aws_security_group" "my_sg" {

  count = 2

  name = "my-sg-${count.index + 1}"

  dynamic "ingress" {

    for_each = var.ports

    content {

      from_port   = ingress.value
      to_port     = ingress.value

      protocol    = "tcp"

      cidr_blocks = ["0.0.0.0/0"]

    }
  }

  egress {

    from_port   = 0
    to_port     = 0

    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }
}