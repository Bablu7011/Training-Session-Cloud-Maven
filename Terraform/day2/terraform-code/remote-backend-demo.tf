resource "aws_instance" "web" {

  ami           = "ami-01b40e1bcccae197a"
  instance_type = var.instance_type

  tags = {
    Name = "my-instance-01"
  }

}
