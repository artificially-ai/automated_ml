variable "access_key" {
  default = "YOUR KEY HERE"
}
variable "secret_key" {
  default = "YOUR KEY HERE"
}

variable "aws_key_name" {
  default = "aws-kaggle-IE"
}

variable "region" {
  default = "eu-west-1"
}

variable "availability_zone" {
  default = "eu-west-1a"
}

variable "ami" {
  # That's ekholabs private AMI which already contains all the dependencies needed.
  # This AMi is private. In order to speed-up the creation of your image, I advise to
  # Create you own AMI based on the AWS one, as I did.
  #default = "ami-f391058a"

  # That's the AWS Ubuntu 16.04 AMI used along the GPU instance and compliant with
  # NVIDIA Drivers NVIDIA-Docker.
  default = "ami-8fd760f6"
}

variable "instance_type" {
  default = "g2.2xlarge"
}

variable "allowed_cidrs" {
  default = ["77.163.214.250/32"]
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
}
