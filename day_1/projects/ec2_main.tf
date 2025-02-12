resource "aws_instance" "s7rosine_ec2_instance" {
  ami             =  var.ami
  instance_type   = var.instance-type
  key_name        = var.key_name

  tags = {
    Name  = "day_1"

  }
}
