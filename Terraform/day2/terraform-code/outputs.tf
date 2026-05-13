output "instance_public_ip" {
    value =aws_instance.web.public_ip
}

output "aws_vpc_id" {
    value =aws_vpc.main.id
    sensitive = true
}


output "aws_private_ip" {
    value = aws_instance.web.private_ip
    sensitive = true
}

output "aws_vpc_name" {
    value = aws_vpc.main.tags["Name"]
}


output "aws_instance_count" {
    value = length(aws_instance.web)
    sensitive = true
}