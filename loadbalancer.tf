resource "aws_lb" "load-balancer" {
  name               = "project-lb-terr"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = [aws_subnet.web-sub1.id, aws_subnet.web-sub2.id]


  /* access_logs {
    bucket  = aws_s3_bucket.s3.bucket
    prefix  = "test-lb"
    enabled = true
  }
 */
  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "elb-tg" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc1.id
}

resource "aws_lb_target_group_attachment" "elb-tg-att" {
  target_group_arn = aws_lb_target_group.elb-tg.arn
  target_id        = aws_instance.web01.id
  port             = 80
  depends_on = [
    aws_instance.web01,
  ]
}

resource "aws_lb_listener" "elb-listener" {
  load_balancer_arn = aws_lb.load-balancer.arn
  port              = "80"
  protocol          = "HTTP"



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.elb-tg.arn
  }
}
