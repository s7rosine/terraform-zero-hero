# Target Groups
resource "aws_lb_target_group" "blue_tg" {
  name     = "blue-tg-2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id
}

resource "aws_lb_target_group" "yellow_tg" {
  name     = "yellow-tg-2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id
}
# Register Instances with Target Groups
resource "aws_lb_target_group_attachment" "blue" {
  target_group_arn = aws_lb_target_group.blue_tg.arn
  target_id        = aws_instance.blue.id
}

resource "aws_lb_target_group_attachment" "yellow" {
  target_group_arn = aws_lb_target_group.yellow_tg.arn
  target_id        = aws_instance.yellow.id
}