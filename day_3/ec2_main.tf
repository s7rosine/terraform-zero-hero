terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
module "ec2" {
    source = "./modules/ec2"
    ami = "ami-0e2c8caa4b6378d8c"
    instance-type = "t2.micro"
    key_name = "terra-key"
}