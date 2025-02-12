# Security Groups
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg_3"
  description = "Allow HTTP access to ALB"
  vpc_id      = data.aws_vpc.selected.id # Correct reference to selected VPC

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP access from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"] # Allow outbound traffic to anywhere
  }
}
