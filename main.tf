provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2-dev" {
  ami = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"
  user_data = "${file("apache.sh")}"
  security_groups = ["ec2-sg"]
  key_name = "d974187"
  availability_zone = "us-east-1a"
  root_block_device {
    //device_name = "/dev/xvda"
    volume_type = "standard"
    volume_size = 8
  }
  ebs_block_device {
    device_name = "/dev/sdc"
    delete_on_termination = true
    volume_size = 1
    volume_type = "gp2"
  }
  tags = {
    Name = "ec2-dev"
  }
}

#Creating EBS Volume
//resource "aws_ebs_volume" "ec2-dev-ebs" {
//  availability_zone = "us-east-1a"
//  size = 1
//  tags = {
//    Name = "ec2-dev-ebs"
//  }
//}

#attaching EBS Volume to our EC2 instance
//resource "aws_volume_attachment" "ec2-dev-ebs-vol" {
//  device_name = "/dev/sdc"
//  instance_id = "${aws_instance.ec2-dev.id}"
//  volume_id = "${aws_ebs_volume.ec2-dev-ebs.id}"
//}
