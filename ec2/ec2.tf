resource "aws_instance" "my-ec2" {
  instance_type = "t2.micro"
  ami = "ami-047a51fa27710816e"
  subnet_id = var.ec2-subnet
  security_groups = [ var.ec2-sgid ]
}

variable "ec2-subnet" {
  type = string
}

variable "ec2-sgid" {
  type = string
}

variable "ec2-vpc" {
  type = string
}