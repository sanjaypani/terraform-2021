provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2-dev" {
  ami = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"
  user_data = "${file("apache.sh")}"
  security_groups = ["ec2-sg"]
  tags = {
    Name = "ec2-dev"
  }
}