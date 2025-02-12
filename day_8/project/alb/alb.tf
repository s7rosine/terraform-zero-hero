# Application Load Balancer
resource "aws_lb" "alb" {
  name               = "my-alb-2"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = data.aws_subnets.public_subnets.ids # Correct reference  # Corrected reference

  enable_deletion_protection = false

  enable_cross_zone_load_balancing = true

  tags = {
    Name = "my-alb"
  }
}
