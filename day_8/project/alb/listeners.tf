
# ALB Listener with Path-Based Routing
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Not Found"
      status_code  = "404"
    }
  }
}

resource "aws_lb_listener_rule" "blue" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  condition {
    path_pattern {
      values = ["/blue"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.blue_tg.arn
  }
}

resource "aws_lb_listener_rule" "yellow" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 101

  condition {
    path_pattern {
      values = ["/yellow"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.yellow_tg.arn
  }
}
