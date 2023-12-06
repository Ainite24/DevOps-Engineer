provider "aws" {
  region = "us-east-1" 

resource "aws_lb" "my_alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups = ["sg-02e2799795df91bf5"]

  enable_deletion_protection = false
  enable_http2               = true
  enable_cross_zone_load_balancing = true

  subnets = ["subnet-0017695cd727aacb7"]  

  enable_deletion_protection = false

  enable_http2 = true
  enable_deletion_protection = false
}

resource "aws_lb_listener" "my_alb_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    status_code      = "200"
    content_type     = "text/plain"
    content          = "OK"
  }
}

resource "aws_lb_target_group" "my_target_group" {
  name        = "my-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "vpc-0f8314f84d0657c90"  
  target_type = "ip"
}

resource "aws_ecs_service" "my_ecs_service" {
  name            = "my-ecs-service"
  cluster         = "my-ecs-cluster"
  task_definition = "my-task-definition:1"

  launch_type = "FARGATE"

  network_configuration {
    subnets = ["subnet-0017695cd727aacb7"]  
    security_groups = ["sg-02e2799795df91bf5"]
  }
}

resource "aws_lb_target_group_attachment" "my_target_group_attachment" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = aws_ecs_service.my_ecs_service.id
  port             = 80
}
