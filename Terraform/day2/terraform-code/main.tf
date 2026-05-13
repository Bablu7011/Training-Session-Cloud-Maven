resource "aws_vpc" "main" {

  cidr_block = "10.0.0.0/16"


  tags = {
    # Name = var.vpc_name
    Name = "my-first-vpc"
  }
}



# resource "aws_subnet" "public_subnet" {

#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "10.0.1.0/24"
#   availability_zone       = "ap-south-1a"
#   map_public_ip_on_launch = var.map_ip

#   tags = {
#     Name = "${local.prefix}-${local.env}-${local.project}-public-subnet"
#   }
# }



# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.main.id


#   tags = {
#     Name = "${local.prefix}-${local.env}-${local.project}-vpc-igw"
#   }
# }


# resource "aws_instance" "web" {
#   #count = var.instance_count
#   ami           = "ami-01b40e1bcccae197a"
#   instance_type = "t2.micro"

#   tags = {
#     #Name = var.instance_names[count.index]
#     Name = "my-instance-01"
#   }

# }

