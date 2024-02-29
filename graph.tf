resource "aws_lb" "lb_good_1" {
  tags = {
    yor_trace = "06566770-1258-446d-978e-68d3996663fa"
  }
}

resource "aws_lb" "lb_good_2" {
  tags = {
    yor_trace = "d4fd91cd-1c0f-4901-a152-89b3d4310ca4"
  }
}

resource "aws_lb" "lb_good_3" {
  tags = {
    yor_trace = "eeb001eb-44d6-4be4-94e3-c0764c367842"
  }
}

resource "aws_alb" "alb_good_1" {
  tags = {
    yor_trace = "5ff10d7c-f7ea-489a-8cb5-b8f83a469106"
  }
}

resource "aws_lb" "lb_bad_1" {
  tags = {
    yor_trace = "f553cb37-92c5-42c5-9089-32e7f4ee3205"
  }
}

resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "46a86c35-e7aa-4971-8afd-0492d8587ad7"
  }
}

resource "aws_alb" "alb_bad_1" {
  tags = {
    yor_trace = "acbd40ff-42be-4f8d-8037-0f9fc9e8d220"
  }
}

resource "aws_lb_listener" "listener_good_1" {
  load_balancer_arn = aws_lb.lb_good_1.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type = "action"
  }
}

resource "aws_lb_listener" "listener_good_2" {
  load_balancer_arn = aws_lb.lb_good_2.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_lb_listener" "listener_good_3" {
  load_balancer_arn = aws_lb.lb_good_3.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_alb_listener" "listener_good_1" {
  load_balancer_arn = aws_alb.alb_good_1.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
  tags = {
    yor_trace = "da281a3e-c8cd-4979-a6de-cda8c25be15f"
  }
}

resource "aws_lb_listener" "listener_bad_1" {
  load_balancer_arn = aws_lb.lb_bad_1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_lb_listener" "listener_bad_2" {
  load_balancer_arn = aws_lb.lb_bad_2.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_alb_listener" "listener_bad_1" {
  load_balancer_arn = aws_alb.alb_bad_1.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
  tags = {
    yor_trace = "67cd75bb-94fb-4002-bbe7-02f824c7190f"
  }
}