# Configure the AWS provider
provider "aws" {
  region = var.region
}

#Start DATA AMI BLOCK
#Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

#Windows Server AMI
data "aws_ami" "windows" {
  most_recent = true
  owners = ["801119661308"] # Canonical (see footnote)

  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}
#END DATA AMI BLOCK

#RESOURCES BLOCK

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type_micro

  tags = {
    Name = var.instance_name_Service1
  }
}

resource "aws_instance" "windows" {
  ami           = data.aws_ami.windows.id
  instance_type = var.instance_type_small

  tags = {
    Name = var.instance_name_Service2
  }
}

#END RESOURCES BLOCK


/*
#NOTES:
To find some base info for data block you need to run the following commands below for your AWS instance
On aws cli cmd, run, 'aws ec2 describe-images --owners amazon --image-ids ami-<some_large_number>'
Then locate the OwnerID value for this image
Take those values and update the data ami block on the main.tf file
*/
