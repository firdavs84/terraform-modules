resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "Terraform VPC"
  }
}

output "vpc_id" {
  value = aws_vpc.myvpc.id
}

resource "aws_subnet" "mysubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "My Subnet"
  }
}

output "mysubnet_id" {
  value = aws_subnet.mysubnet.id
}

resource "aws_security_group" "mysg" {
  name        = "my-sg"
  description = "Allow HTTP/HTTPS/SSH inbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "HTTPS from Web"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from Web"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
    ingress {
    description = "SSH from Web"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow Web Traffic"
  }
  
}

output "mysg_id" {
  value = aws_security_group.mysg.id
}
