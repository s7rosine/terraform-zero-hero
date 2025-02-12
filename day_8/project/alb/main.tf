# EC2 Instances
resource "aws_instance" "blue" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnets.public_subnets.ids[0] # Use the first subnet ID from the filtered subnets
  vpc_security_group_ids = [aws_security_group.ec2_sg_2.id]
  key_name               = "terra-key"
  user_data              = file("${path.module}/scripts/script-blue.sh")

  tags = {
    Name    = "blue-app"
    Project = "blue-app"
  }
}

resource "aws_instance" "yellow" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnets.public_subnets.ids[1] # Use the second subnet ID from the filtered subnets
  key_name               = "terra-key"
  vpc_security_group_ids = [aws_security_group.ec2_sg_2.id]
  user_data              = file("${path.module}/scripts/script-yellow.sh")

  tags = {
    Name    = "yellow-app"
    Project = "yellow-app"
  }
}

resource "aws_route53_record" "blue_cname" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "blue"
  type    = var.record_type
  ttl     = var.record_ttl
  records = [data.aws_lb.alb.dns_name]
}
resource "aws_route53_record" "yellow_cname" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "yellow"
  type    = var.record_type
  ttl     = var.record_ttl
  records = [data.aws_lb.alb.dns_name]
}
