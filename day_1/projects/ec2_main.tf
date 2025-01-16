resource "aws_instance" "s7rosine_ec2_instance" {
  ami             = "ami-0e2c8caa4b6378d8c"  # Replace with your specific AMI ID
  instance_type   = "t2.micro"
  key_name        = "terra-key"

  tags = {
    Name  = "day_1"

  }
}
