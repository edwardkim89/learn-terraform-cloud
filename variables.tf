variable "account" {
  default = "platformdeveddy"
}
variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type_micro" {
  description = "Ex of Micro EC2 instance to provision"
  default     = "t2.micro"
}

variable "instance_type_small"{
  description = "Ex of Small EC2 instance to provision"
  default = "t2.micro"
}

variable "instance_name_Service1" {
  description = "Service1 EC2 VM"
  default     = "service1-ec2-t2-micro"
}

variable "instance_name_Service2" {
  description = "Service2 EC2 VM"
  default     = "service2-ec2-t2-small"
}