variable "access_key" {
  default = "your_key_here"
}
variable "secret_key" {
  default = "your_secret_here"
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
