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
resource "aws_instance" "s7rosine_ec2_instance" {
  ami             = "ami-0e2c8caa4b6378d8c"  # Replace with your specific AMI ID
  instance_type   = lookup(var.instance_type, terraform.workspace, "t2.micro")
  key_name        = "terra-key"

  tags = {
    Name  = "day_5-${terraform.workspace}"

  }
}
variable "instance_type" {
    type = map(string)
    default = {
      "dev" = "t2.micro"
      "stag" = "t3.micro"
      "prod" = "t2.medium"
    }
}