# Define provider and AWS region
provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

# Define variables
variable "ecs_cluster_name" {
  description = "ECS Cluster"
  default     = "my-ecs-cluster"
}

variable "ecr_repository_name" {
  description = "heloapi"
  default     = "my-ecr-repo"
}

variable "ecs_service_name" {
  description = "Name of the ECS service"
  default     = "my-ecs-service"
}

# Data source for ECR repository
data "aws_ecr_repository" "ecr" {
  name = var.ecr_repository_name
}

# ECS Cluster
resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name
}

# ECS Task Definition
resource "aws_ecs_task_definition" "ecs_task" {
  family                   = var.ecs_service_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  execution_role_arn = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([{
    name  = "api-container"
    image = "public.ecr.aws/z0u2v6u2/heloapi:latest"
    portMappings = [{
      containerPort = 80,
      hostPort      = 80,
    }]
  }])
}

# ECS Execution Role
resource "aws_iam_role" "ecs_execution_role" {
  name = "ecs_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com",
      },
    }],
  })
}

# ECS Service
resource "aws_ecs_service" "ecs_service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets = aws_subnet.private.*.id
    security_groups = [aws_security_group.ecs_security_group.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_target_group.arn
    container_name   = "api-container"
    container_port   = 80
  }

  depends_on = [aws_ecs_task_definition.ecs_task]
}

# Load Balancer Target Group
resource "aws_lb_target_group" "ecs_target_group" {
  name     = "ecs-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-0f8314f84d0657c90"

  health_check {
    path     = "/"
    protocol = "HTTP"
  }
}

# Security Group for ECS Service
resource "aws_security_group" "ecs_security_group" {
  name        = "ecs-security-group"
  description = "Security group for ECS service"
  vpc_id      = "vpc-0f8314f84d0657c90"
}

# Output ECS Service URL
output "ecs_service_url" {
  value = aws_ecs_service.ecs_service.load_balancer[0].dns_name
}
